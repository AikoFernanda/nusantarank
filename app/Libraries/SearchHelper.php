<?php
namespace App\Libraries;

class SearchHelper
{
    public static function getPageRankScore($id, $db)
    {
        $query = $db->table('pagerank_result')->getWhere(['id' => $id])->getRow();
        return $query ? (float) $query->skor : 0.01;
    }

    public static function calculateRelevance($query, $data)
    {
        $query = strtolower($query);
        $fields = ['judul', 'penulis', 'tahun', 'abstrak'];
        $total_score = 0;

        foreach ($fields as $field) {
            $content = strtolower($data[$field]);
            $total_score += substr_count($content, $query);
        }

        $current_year = date('Y');
        $year_diff = abs((int) $data['tahun'] - (int) $current_year);
        if ($year_diff <= 1) {
            $total_score += 0.5;
        }

        return $total_score;
    }

    public static function highlightKeyword($text, $keyword)
    {
        return preg_replace("/(" . preg_quote($keyword, '/') . ")/i", '<mark>$1</mark>', $text);
    }

    public static function search($model, $keyword, $db)
    {
        $results = [];
        $query = $db->escapeString($keyword);
        $skripsiList = $model->getAllSkripsi();

        foreach ($skripsiList as $row) {
            $relevance = self::calculateRelevance($query, $row);
            $pagerank = self::getPageRankScore($row['id'], $db);
            $final_score = $relevance * $pagerank;

            // Simpan relevansi ke tabel pagerank_result
            $pagerankTable = $db->table('pagerank_result');
            $existing = $pagerankTable->getWhere(['id' => $row['id']])->getRow();

            if ($existing) {
                $pagerankTable->where('id', $row['id'])->update(['relevansi' => $relevance]);
            } else {
                $pagerankTable->insert([
                    'id' => $row['id'],
                    'relevansi' => $relevance,
                    'skor' => $pagerank
                ]);
            }

            if ($final_score > 0) {
                $row['score'] = $final_score;
                $row['relevansi'] = $relevance;
                $row['pagerank'] = $pagerank;
                $row['highlight_judul'] = self::highlightKeyword($row['judul'], $query);
                $row['highlight_abstrak'] = self::highlightKeyword($row['abstrak'], $query);
                $results[] = $row;
            }
        }

        usort($results, fn($a, $b) => $b['score'] <=> $a['score']);
        return $results;
    }
}
?>