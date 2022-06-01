module EnologistsHelper
    def sort_magazines(enologist_magazines)
        enologist_magazines.map { |em| [em.magazine.name]}
                           .sort
                           .join(',')
    end

    def sort_job(enologist_magazines)
        enologist_magazines.map { |em| [ em.editor, em.writer, em.reviewer]}
                           .sort
                           .join(',')
    end
end
