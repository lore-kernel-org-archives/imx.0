Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527641CAA4
	for <imx@lists.linux.dev>; Thu, 16 Jan 2025 01:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736991894; cv=none; b=IrkZ0ems1uOC1BBc9RPVihE5CK7cdhMbuzmVBLh7H+DGJEGmlOBszyuuzTngVqATz9K2Y94JtCQpc7WjPqobc1R05VMtXG38ThKCWtcQzGtO/OgYMUs9zl6auEbrg1kPgVEUcdVOSISYNw0nKD+7ANeeaTuDtWPEKql9sxgze7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736991894; c=relaxed/simple;
	bh=4BUCba/+fEkyAPQFGiidqmmL2WMf8cW+5Cxd3Mv84Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUybbsI4OhlWXz0h8K5wyIp88vxiK4ViwtQzvq5LvBoc5ihb7wSsl/EQ1j1eAfMjCNlzQHe4GYxDa1UQ2RBSQ2PFvJCIHgPHjVz4FqSFA+eU72Jhfhg4evtcYI8U+TdLcJpQ8/tTm8pOZ+W9YDfAugU0ABKVDBgQlIL8gXfKgtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21675fd60feso7118985ad.2
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 17:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736991892; x=1737596692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IxnCSmHJcqdacHXHVn26Xp3ngLM6GH49N7wfCQU1L0=;
        b=R9JNsvPaxhv07XxEyilv8R+5qTNPF/zS49wYTtA/0qFHtNcQMNaUiUXA1EipSrUF2G
         FZhdwgP5N4S6nLjSKmko+cFpHn8GY+qac2WXQ75CyWt9/iZCxrGIJ5jn6KcyRspf6urJ
         EMbo4dQhbgdLNH3M6jEpKMR5lmiXBCd7VG5of/TYabCwqPOZlBKQvgDcwfZFGDQ5kr4K
         uWQy2Iwk8if/fu5iK8TjWh8CIx8izE72P+QzA9Fsbo3OurPw4wC3Spnv/IvUymT0iXeD
         ZYI6tfql3F3I7NtKdhk2zExcS/3zVUL17ZLcCYhR/I4Xuuxw9AfYvo+FbOrMpLCrzOJF
         GO8w==
X-Forwarded-Encrypted: i=1; AJvYcCW3hc3S+EJzF3o6FXzg50l3mH6gtz+buwbGkt+FXrQYYGcICEM4EJfloHNRSB4nyS/QULI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy+MQV4vuMm67BCsX7TSdw78T9ai/JcRXYU8PI1RjX/KolKlcf
	yXPzqTjzLGiQYxj8cmzPSuHUPxaemQirTBUnXF5uTFhBLllS0Zdm
X-Gm-Gg: ASbGnct8WPhLhLyJgocRU+acLGD+1tfovXR/fIxDXOscWJ/DGKSFoen2SPcrZ41dkmU
	C9UZexfhEf4lFvwO1T0q9vec8fqXIGlNaUQ0blbg5eY/RQGYcL0BTt8e+vipRJYmbSoJm8S8JQa
	8vmgUuVW9pL3mU9MVEO5T1Ry+jQitNi49NUHSv+r2U1J1ylZ91TH0wG7rXAkJxbcuh9szxii0rd
	GZFcqfDWG1ENSWqehFipwT0LuTrmb72FkD6RWeerqyB2kmGbbkCaoVVHwjuJJLR+DFfDnJm6HU6
	foHJe+2wVr3lEt4=
X-Google-Smtp-Source: AGHT+IGGiOe+Hpc0pTCxovPJPJMYD6+JInJoiYZN0S/mOekGvxlc2y5Gy3dg47SbKjnI78xknytLhA==
X-Received: by 2002:a05:6a21:328c:b0:1d9:c78f:4207 with SMTP id adf61e73a8af0-1e88d18b316mr46931346637.11.1736991892554;
        Wed, 15 Jan 2025 17:44:52 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a3130d2eea3sm10500937a12.0.2025.01.15.17.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 17:44:51 -0800 (PST)
Date: Thu, 16 Jan 2025 10:44:49 +0900
From: Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kw@linux.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 0/10] A bunch of changes to refine i.MX PCIe driver
Message-ID: <20250116014449.GA2111792@rocinante>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20250115130406.GS4176564@rocinante>
 <20250115130609.GT4176564@rocinante>
 <AS8PR04MB8676BD2E443B72DFECAEFEE18C1A2@AS8PR04MB8676.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8676BD2E443B72DFECAEFEE18C1A2@AS8PR04MB8676.eurprd04.prod.outlook.com>

Hello,

[...]
> Thanks for your kindly help to pick up this series.

No problem.  Thank you for persevering.

I apologise for letting this fall through the cracks.

> I checked the patches, they are fine to me.

Thank you for double-checking things for me.  Much appreciated.

> BTW, I saw the dts patch had been queued into pcie/next too.
> It's better let Shawn merge the dts changes after the driver patches are merged.

No worries.  I will drop the patch.

	Krzysztof
