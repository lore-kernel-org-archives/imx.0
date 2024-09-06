Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F67FBD1
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 06:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604274; cv=none; b=Ql0oi46S309WpNJrHOVUpqx2e5Jy2CzH+W1qTF6IS/2wZhvSumsebzXcD7GQeu9S3ZQVe64/knwCyR5eT1KAQMiizOeXB6xVKahfxiiNmBaQCWC3jRIYgPEZZ4A+AU6jc1LodkHzvpcZ5qz0sxl1TOSVa2LgHbiQcB3f7sHp38k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604274; c=relaxed/simple;
	bh=EAEXrS3ujlWSIv1zD3lw1caH9nctH2DdMNjEoPs+GTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QF6sFWNCZcSvjblfA4ehezy/hGxMS+mHGus3+FRsqt+iPwtgzH/f4GGDvnQVYGYQBmZhj2I7/kwB7XkHKdbXhpF6nBTdSjv3ViwDG+uvSwfTg4cQ6yTXlPYnXwwC1auUGx3VjaAm37FIibgkgh3OldAZ6Fe/64DX5LLSVDukwE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-206bd1c6ccdso16089985ad.3
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 23:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725604273; x=1726209073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUlqUwaLIWNbsVjRhWvuXLWwMr5ykeNKJnP9nNXvjaA=;
        b=PFhvJQj0UixnSDw5mBbGcL9oEmdTD4/k/RSxjssDGxMm+DNZPie2Y26l6kkY2T0lbA
         EjHmis7IzCBnLiXaOWkhC5l5DbdoT+OnQv3mTNREp/EUIxslpukcvyu5GuuikhjJouox
         Oq0W86uIFlAZHX6QFEU+8nNU27JFJLft8gMn2sM/9uzzft7f/moNkkaP95SEGSyikohP
         J5TJnmtziERbGUEWZL0zTwf41QUxXCPHgcJGb09811VuNT56iwYj/k7/+3joOQ+G/rhJ
         te557zDrxn6ra80/z/C1mam2AQSmB165/C+RTMigHsMTk10hEbWl4xg1+H8MQQ1PVOho
         TmMA==
X-Forwarded-Encrypted: i=1; AJvYcCUqZOFEpjdNtkYXawXcXIdm5BYxe7ldCm9bHu/8hV8JsGDjqvW7Qvsf0uEUgmMQV8Cs6gc=@lists.linux.dev
X-Gm-Message-State: AOJu0YykNA6vwv6joOTQxn0OpNSaBru7j4k7b3sXWVPI4JhfTBTADepd
	HKd92IZyRIN2jf7G1h/VPEpms7ZPUDG4s1g48tqY2mv3pukjoGIW
X-Google-Smtp-Source: AGHT+IFDFoOk1bH5c4RXh8ffMzQ0h3Mv865nSfiJ+AC1ztLE71RolJQdzxnMQJba93jTnE+ady0DAw==
X-Received: by 2002:a17:902:e80e:b0:206:d6ac:854f with SMTP id d9443c01a7336-206f049d45amr15829625ad.3.1725604272744;
        Thu, 05 Sep 2024 23:31:12 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea38c31sm37371035ad.151.2024.09.05.23.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 23:31:12 -0700 (PDT)
Date: Fri, 6 Sep 2024 15:31:10 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, l.stach@pengutronix.de,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/4] dt-bindings: imx6q-pcie: Add reg-name "dbi2" and
 "atu" for i.MX8M PCIe Endpoint
Message-ID: <20240906063110.GA679795@rocinante>
References: <1723534943-28499-1-git-send-email-hongxing.zhu@nxp.com>
 <1723534943-28499-2-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1723534943-28499-2-git-send-email-hongxing.zhu@nxp.com>

Hello,

> Add reg-name: "dbi2", "atu" for i.MX8M PCIe Endpoint.
> 
> For i.MX8M PCIe EP, the dbi2 and atu addresses are pre-defined in the
> driver. This method is not good.
> 
> In commit b7d67c6130ee ("PCI: imx6: Add iMX95 Endpoint (EP) support"),
> Frank suggests to fetch the dbi2 and atu from DT directly. This commit is
> preparation to do that for i.MX8M PCIe EP.
> 
> These changes wouldn't break driver function. When "dbi2" and "atu"
> properties are present, i.MX PCIe driver would fetch the according base
> addresses from DT directly. If only two reg properties are provided, i.MX
> PCIe driver would fall back to the old method.

Applied to dt-bindings, thank you!

[1/1] dt-bindings: PCI: imx6q-pcie: Add reg-name "dbi2" and "atu" for i.MX8M PCIe Endpoint
      https://git.kernel.org/pci/pci/c/2f309c988b7c

	Krzysztof
