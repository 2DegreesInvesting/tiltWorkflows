# yaml_path()

    Code
      show(yaml_path("profile_emissions"))
    Output
      ---
      title: "{workflow}"
      output: github_document
      params:
        chunks: ""
        order: "sample"
        cache_dir: ""
        input: "input"
        output: "output"
        europages_companies: "europages_companies.csv"
        ecoinvent_activities: "ecoinvent_activities.csv"
        ecoinvent_europages: "ecoinvent_europages.csv"
        isic: "isic.csv"
      
        emissions_profile_any_companies: "emissions_profile_any_companies.csv"
        emissions_profile_products: "emissions_profile_products.csv"
      ---

---

    Code
      show(yaml_path("profile_emissions_upstream"))
    Output
      ---
      title: "{workflow}"
      output: github_document
      params:
        chunks: ""
        order: "sample"
        cache_dir: ""
        input: "input"
        output: "output"
        europages_companies: "europages_companies.csv"
        ecoinvent_activities: "ecoinvent_activities.csv"
        ecoinvent_europages: "ecoinvent_europages.csv"
        isic: "isic.csv"
      
        emissions_profile_any_companies: "emissions_profile_any_companies.csv"
        emissions_profile_upstream_products: "emissions_profile_upstream_products.csv"
        ecoinvent_inputs: "ecoinvent_inputs.csv"
      ---

---

    Code
      show(yaml_path("profile_sector"))
    Output
      ---
      title: "{workflow}"
      output: github_document
      params:
        chunks: ""
        order: "sample"
        cache_dir: ""
        input: "input"
        output: "output"
        europages_companies: "europages_companies.csv"
        ecoinvent_activities: "ecoinvent_activities.csv"
        ecoinvent_europages: "ecoinvent_europages.csv"
        isic: "isic.csv"
      
        sector_profile_companies: "sector_profile_companies.csv"
        sector_profile_any_scenarios: "sector_profile_any_scenarios.csv"
      ---

---

    Code
      show(yaml_path("profile_sector_upstream"))
    Output
      ---
      title: "{workflow}"
      output: github_document
      params:
        chunks: ""
        order: "sample"
        cache_dir: ""
        input: "input"
        output: "output"
        europages_companies: "europages_companies.csv"
        ecoinvent_activities: "ecoinvent_activities.csv"
        ecoinvent_europages: "ecoinvent_europages.csv"
        isic: "isic.csv"
      
        sector_profile_upstream_companies: "sector_profile_upstream_companies.csv"
        sector_profile_any_scenarios: "sector_profile_any_scenarios.csv"
        sector_profile_upstream_products: "sector_profile_upstream_products.csv"
        ecoinvent_inputs: "ecoinvent_inputs.csv"
      ---

---

    Code
      show(yaml_path("score_transition_risk"))
    Output
      ---
      title: "{workflow}"
      output: github_document
      params:
        chunks: ""
        order: "sample"
        cache_dir: ""
        input: "input"
        output: "output"
      
        emissions_profile_at_product_level: "emissions_profile_at_product_level.csv"
        sector_profile_at_product_level: "sector_profile_at_product_level.csv"
      ---

