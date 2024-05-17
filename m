Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8033AC2F
	for <imx@lists.linux.dev>; Fri, 17 May 2024 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715943938; cv=none; b=TU5+aovln18lRqpgmC9N/nCTLMh9kMhStM4JF88EkOwb9MRCfF73U2IhTjlxT5nwpxEKm4N4wuCd0YmrhbjcIgTBklZSScMUwytJPcEuQQV8CfvAHEXjfAYOREGvsf0aL5Xl6qkOJE39nl5py4DmHxBrIdRUG6tcnwYD8MK/2mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715943938; c=relaxed/simple;
	bh=joiLGwoaKTuni3oVmgyg7NhIzlp5h0zbna1gE4Ju7BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/sGqFSf6qZ7C1WBvZZsXHWGmPAvYV9vFKWnmZBJygqhA7B4R1WZ0VYoyNF5e879qVnfs9JjUgbhYkQ9Q5qmjZU00/59dizT0McXcdsJf+SvkZ4Ikamx3Y6EW3dcBnW7RiU+g0XcccwQ14D5GXPB2ptACAqj4XaLmtn5TyaLg00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1edc696df2bso5821665ad.0
        for <imx@lists.linux.dev>; Fri, 17 May 2024 04:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715943936; x=1716548736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9C2Iabb3KviDiU9pcCXgYKqv3XsqyMThgxMVc/vM2p4=;
        b=H1UqcYVNRT/tLoSqLn4zN4kKjn8OdH1Z+uXrM8ZzeTV/9mN8bwplKaNDqxzfy7H7Gi
         fvhCYFjf+WQewkFyY83RyNV43LmBS1B6laBi1err/2ifssalQPi+eCNAK+mm2q4VBSyW
         PkizJmmdyXFmBtKVXC1l0bTbMu+njrJCLq9eomxvD7ABrZd73N6RtUdPYCvyebNXoYwv
         nKDibLrumRYULV7M/0F2QmX2P67nnHqSWPH90Q+jJzRYpIJei5SBEd/zcUEQw8gdlS7m
         oBt9FNZXFPb63VNX7WzWIGfEuI339XPaFKa2c1FqB2oB749d3LL17BL4h6HZImqgM8oK
         qdsg==
X-Forwarded-Encrypted: i=1; AJvYcCXrOam32fJ+iekEZ0AF9uDABouAM4eISkd+BRMq8yEV75BJTH/zBXLEV/HuNYNEFZHwrGbA6L9Nec8iPDO3n2bCW085
X-Gm-Message-State: AOJu0YxlTiYHk1i203cLmwwK7lLK0bHasiM16fEBtutAm2VutPD25FKW
	tRiVkouo5ubkkKPb0lkBIchhnBMzR7TQnDPrXCipmdAYDrd7lg+7
X-Google-Smtp-Source: AGHT+IFVZdoYJON530fO2X5rbONRy5CjwQQ+lZEF08uQn3U+A5Sjp3qY7qXlWDjUU4wnnrZPzKSgXg==
X-Received: by 2002:a17:902:74c8:b0:1ea:cc:b59e with SMTP id d9443c01a7336-1ef43d2e3ccmr209410165ad.19.1715943935982;
        Fri, 17 May 2024 04:05:35 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad7dc1sm154334805ad.89.2024.05.17.04.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 04:05:35 -0700 (PDT)
Date: Fri, 17 May 2024 20:05:33 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: pci: layerscape-pci: Convert to yaml
 file
Message-ID: <20240517110533.GL202520@rocinante>
References: <20240207231550.2663689-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207231550.2663689-1-Frank.Li@nxp.com>

> Convert layerscape pcie bind document to yaml file.

Applied to dt-bindings, thank you!

[1/1] dt-bindings: PCI: layerscape-pci: Convert to YAML format
      https://git.kernel.org/pci/pci/c/24cd7ecb3886

	Krzysztof
