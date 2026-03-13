Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FDE3C871D
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 16:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420413; cv=none; b=hZE3JtlqM3DZ/MzwyyngkuCE7uo5u7rQw0PsVkCxApKvQvV5zCRqANXkql3tLOZpjvz8GwLWtvO50WFv+s68oYis5zxpqS+xB1YSqxfRB0ZdanCaUu/hD8o/XX8ShGrbypwaN/AWeUP28NNj/zs/VVPTAVGYkgoausb8pohvlv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420413; c=relaxed/simple;
	bh=F4ZkVUOJAKUck0lnsuXdsP2LuYwnHclKSLue4Bt0/lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4LytSXkJJ9H+p+xD42SyOEdk4el7O3ha8PG6h0G7/nx+C8Bea1JJHxB3024l41TiF7eG9YjwdAoD0sh8x1O8feGCmozlUu6NZvu7DY20Kkd7ksbzWYJBXag53hFHrR+mOALBwVVtWVzRJF/PrI/9Qq8n4w4g9hnfvS9MrRXYdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llojCENW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llojCENW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853aec185aso20696485e9.1
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 09:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773420410; x=1774025210; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyVi9ie4kjBemkSiAX2WnD6MGaPKy+GHNmKR/i8NVt4=;
        b=llojCENWVABq4ar23rvGRbPmyDSgiN6+Ey5Jxlk2FEjgF611YusLdD5ECtAG7h50dM
         +tDCB0DARxbQBg7yUzos7D2eLNh7cl9/2LNAZW1GdFn7CtL2e6tOcyJ6LrbL0v2iCa8y
         kaXj5rJJn5r/LnBQwVqSYjgnPFEVVEG55GjzUIwt0UVBZDllkhCWRi93vNHcnRd+Gxyu
         v16AH3IC1G1zBOfegzKT9XE70xdbhm2MhN4F83nYohIwzf7gPhAsM+B874WkSvAXcCQR
         kqQJLWb9S81CPchmUdS3yxPKDIZxohtCrWQT0Cna75Qm6NE3G4yXaiVvDUayzZCIyti+
         t2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773420410; x=1774025210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyVi9ie4kjBemkSiAX2WnD6MGaPKy+GHNmKR/i8NVt4=;
        b=Zl9IlwCGSM9yfBmeWAQDjkjLViNlmiJuamGr52IkHWFf2TEMurmtRKa9V4uzeTS8Jh
         kCT9al6sdQcZO9JrGai3wAsqMB9Mhx/Yc8RJCeggd+gcJdFWr7JLB7H7O7xXhKDRBvhO
         ntMJDrgPgDrHRwIFcbKIaH9yI1llfgX4ekoYVeMrEGMao+J9AZ2TA4US1qqHlyB85Xli
         oJCX9azzF8tjaXubMgD71WXVmx63Xb3SsMz8yprCgc3Hm3RyLNROBjn+7FwPbvz1dcnC
         hd03Mj9enFXNml3AuTkW0KUUrfwFiq0n/sqSjZ2VUzMho+ephPgJn4GzlYOcGzQa8iR3
         mCdA==
X-Forwarded-Encrypted: i=1; AJvYcCUvQQTD4aACF30llaATdWw0CAyqiNMEFp/fUSUmWFb+AzJgYRog/LGOZfL13xkYqf0PDFw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzb7fJKXBX82Mex40V5APPhWBFds4ic7ePJhGviX+KlRn0077I
	HmonBK/0yRxZDX8iDZGOiWhogij7KBPlaXgfLZDjzPmGowm+WuPT3ssK
X-Gm-Gg: ATEYQzzQGdMPksSTN42TA70cOsQpPmgaLwjm1Xw+nRxVse1Rj8v4lLcDBVrq8AP+8rr
	WlPYAlAQ01tA9m6Y/rC1F+zO9ciBFBUHgPAXYdTQ2oEHMRbchoCwcF/YDkuO6ZcmslQYcvKhvQf
	Pw8fFviNrFcfoSlkecTDJfMYl0GwnE7+GKxiYtavwT3qn0ZqkDQhslr58SovZivKU8RPTyg1Mdt
	iqwsjwIBw47sfJCw0AfAUNyzRsynMgKd6yQokXVUscu4JhUgyO8/tWSc+t/EhYPaG1cXi5QhQlJ
	1tvF0UC4fnqWfKtaT8QKkvxD7qbgy72vtxcMkdkBdAsc5pYPOcp2wdb+28zrh2WOheY/AsX4CHq
	245x1/XcK4fw7tsnu7mqPV04HFdh9EeIvijM4P4KF3DRUmtK8QFLeRPnn0aWFVFmSRdox8IQ9CU
	GikzKRhx1GfLRSkNgr7W7wEl50hVxSi8vHkyHF1SA/5W38vmfb2As/djwzhv1GAUOjk6DJmpE/0
	tQollpmJK23YtzfQcWhhXpIbJZvh+Llq+QF/BfftEuIaQ==
X-Received: by 2002:a05:600c:a4b:b0:485:3692:e8f7 with SMTP id 5b1f17b1804b1-48556707ddbmr67083435e9.25.1773420409865;
        Fri, 13 Mar 2026 09:46:49 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855638cebcsm59182635e9.0.2026.03.13.09.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:46:49 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:46:47 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT with variants
Message-ID: <abQ_d9fGarNobYdo@Lord-Beerus.station>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <7c84625f82c562bb9cd2b455465d63a1a25bf19e.1772898346.git.stefano.radaelli21@gmail.com>
 <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5C+USp34WQ9ap+N9ha6EgU7JgsYkRsLEW=ZdizbkMQvPA@mail.gmail.com>

Hi Fabio,

On Fri, Mar 13, 2026 at 01:41:02PM -0300, Fabio Estevam wrote:
> 
> One From line is enough.
> 

Yes, that was a mistake on my side. Something in my workflow ended up
adding the "From:" line twice. I will fix it in the next revision.

> 
>  imx8mm-var-som-wifi-brcm-legacy.dtsi is not included anywhere, right?

Correct. It is not included anywhere at the moment.
The Symphony evaluation board uses the IW61x configuration.
The imx8mm-var-som-wifi-brcm-legacy.dtsi file is kept as a separate include
so that carrier boards using the legacy Broadcom-based SOM revision can
include it if needed.

Best Regards,
Stefano
