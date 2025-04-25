Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAF2252286
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 12:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585475; cv=none; b=iv5OoZhScAGOMKl7tJKouUzqE31dMCa4WwXC/DCUvK0rV8B77B9/ULTETIy7h+9qXdAUtTFzVc9g3AiwTTNIuxKPKPK29Ip1Qt5WM2Z2ZT3f4MpyO1pt1Mq6pAfSsjeNbwT6vh4bi9AXpUONH1nI0R5rP+mK1rr5axFOsq2ah5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585475; c=relaxed/simple;
	bh=wmiEsRCKskC/Mif+OPtRe3wDfkOxVjGaJYhZdFWjEdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvcKH6EZzpbvtOgSoUHXnPPJ6b93XLakuwl1fWEAkPndDjsrVfJtlH9iSW36VQ0jjBqF5Y7AKifQrOCZn3bFdMuhSqjdIrdapvnRJBLNZpEgF9WgHTE4HoGR2lUxbCWvP6+q+W0GAX9A/OcQHM5nOqlZb3EA/TE4wszv8tGlEWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHlgqvHR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHlgqvHR"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb5ec407b1so368229966b.1
        for <imx@lists.linux.dev>; Fri, 25 Apr 2025 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745585472; x=1746190272; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=19SQnt4bgMlzflhUBdgnvIZw2qMd2olVK4+5/MXutG8=;
        b=BHlgqvHRXPbQ+IJYwLjcra+H8dKlcJa7zst+CI2Wt23p+YerGmtldFmyOdM26TtBN4
         qyF3FQYdZmQVy4iY5s2iQ5XCS9KNVjCKzPiEtoNp12jXuF95Tp9/AWpJCgdq9rzYEl7K
         GcjXE2VNqXggeS+tsECTTFQuTE/rhLZ6Hu4rNg5GWIPPl+ao5vaddhC71HODtO6UNC7l
         chtW+5n/wRuO/ZbclFXXFqn53QqXMCpPmGVpCSTqOhah2tn/sAr2heEL+d9i654Iy1Oh
         nYwrEa6eoxAnentcr0JmwAE8fIpGRMhZH9Vw4WCJOnW7dOoPqegIkJ2ZC1zBtZRZBLUS
         aiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585472; x=1746190272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19SQnt4bgMlzflhUBdgnvIZw2qMd2olVK4+5/MXutG8=;
        b=Xjj+k1OM91pZ8gntbHtBCwUyPRTbmb8Dm6+KSNNoAgEgp12pm0sHLrvgnafl194qS8
         /0TwU4KH8B/tUpoU+SYsMD51lwtOrJi29yzbqf4HX6AjctOzhvRMirK/eXAzNr2M/7Ty
         SjFBSk9/uP3/c7WoDK0WLqI+mq+iSwo98jUyUFDzL2dTMQY+i8bDQyVUHL6Gmacnkm/6
         n9tOPkKwOuLiAMslTUKBzKq1jED4PIo6SI3E83nkZkL4EEpVe2rv1ArMq393xexpY2DC
         f06KaDbNBHpDY0/cm5ZRAa05dzco3AK7JC5edWn0ly76E5PcAsxutg7uDat3liag+2oN
         VCwA==
X-Forwarded-Encrypted: i=1; AJvYcCWsQBBO7FIGuBgrtjg1lcXypaZA7W5bax6CQXX4hlCAK7U9cZxLd1RD5nISQEMx/MNx/5Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTI7PR17Qv9+X3bPirckOgpUIrpPvJKBmPWGkxlvuVGyaz1zBX
	6rpg884IzFrKlKPxGlzDrHvkc82sc36C0+NhucWa28ap359KdBiv
X-Gm-Gg: ASbGncvBbDJZHJPbdX5neEqxgtHQAGrQSreC+6O2jQ2UaVyRCjMhZD0VMK3NISf097a
	FIcCwZA183aL+yV6c1LaoeRRPU2I01vmhSBy3eFyeZEO/TmCHyZBo4KyVSpiYeediCNy2aIJWpT
	1fFE+N6Z3Euj9DcsXKOJsGhAp4ap7iEI2+ACpE0mm31qzP9dewrrBrtBxgksvt63fXhJfPugth1
	AakmptJ4ceZnC76uWfBP6jVkHhzL0Ffb1RvrZF32YBk1d9KeI09AjsGYp00T3VAQKs2L1yjp0kJ
	D+7Bjhwn4DerTfBcqdAGy7ZSN3aUh1n4BDW7rgPAGUtGK8duCPqdpWfIulL8/trGJQ==
X-Google-Smtp-Source: AGHT+IH/NrWffoy/u2nsOLxymoZYRZ+CZhi9kKY0D1DpYpA2UcXxmclpaKgPo2+5Qdo1fcEv82aORg==
X-Received: by 2002:a17:907:781:b0:aca:cad6:458e with SMTP id a640c23a62f3a-ace713c2584mr182471466b.43.1745585471276;
        Fri, 25 Apr 2025 05:51:11 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e4f8835sm136631966b.67.2025.04.25.05.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:51:10 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:50:10 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm
Message-ID: <aAuFApCnKVqKA1Zu@graute-macos>
References: <20250407-imx8qm-watchdog-v1-0-20c219b15fd2@bootlin.com>
 <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx8qm-watchdog-v1-1-20c219b15fd2@bootlin.com>

On 07/04/25, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
> 
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
