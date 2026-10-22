Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678552;
	b=FVVFZIRv5Xj2Pu1+tn/9vFNb7Rtv6no2iaAPIbW7CUyyJv4TEBn+pt9VGb7AZFYGoo3E
	 2s0E/1HrPEuo3rhZU1LKcG7Annx2bbUfvZiebpzeDewVW9mlGNGvD4SialUWBYqSmrnpM
	 zqqqPvl9BZeoPsF299NH1LS55JR4hRmHMczEPuyuSRnRR2yTulMiiRZ7WSU1J8E01kNWJ
	 PiNwHuiy6TAPklslXwy7FiTB12acVAjXE46jbLCgpiUISpv2GSavAzCc5tNaJnFCVv/pT
	 aQ1H/5r7+McUvDQgvcjkFnkSi68PGkpnE2Vj/G3L/HxWeJld9SgnZbNlMALwOiydD2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
	b=luAUyPX2bDtEp9+JYgde9NKowEropWKfI+RG0ywl4LSPqvQ8Ka8WM9SzOZVKxfKH4oFO
	 JlJwv/UeJgtxiFDe4qrYprQyUVtKzaCMBMSNghn5DLCj9rYA/8xMek7fYSUHF+whtm6Zs
	 qJCvtznFFcPR7GJxpzgSEBd2jAs4/V5iTE+iEZhmsswTDoPaM05mXr/PE5Oq/QwL4ruIf
	 T06HubQVdcE6vLzsdJ/dWNuTUe/yeOftycIB7U/knIFQ20yYofZlaRDD73oYIb67JfqIN
	 fQ8+i9AzPt6iaNRW/pQqEJ0tkFr3ex3w9gJzeVCBH0izaj/XLdnu6Vgcsoitxqra7LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="g6uXL/Cl";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACB6606A31D
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ACB6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g6uXL/Cl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso16602745e9.3
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678550; x=1793283350; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
        b=g6uXL/Cla5irmFD1V0JPyI48wOVvSr3LcaDWgZaxhmbvB0LCGWz2fUJvtwooyXrz1S
         DC/cScLoUMk+fz6wGyhCZsQBtxsSQb7f1kxFwOKaa9YkozeWuDBIz/cdoFcdhljyDbU8
         g5bGsZpW2XyIpPUI8MRcq1vr9Pqy+oJJhbbUWtu6LzYLDOK5qRczoR0ZK59IOgLMgaMU
         +mBoZXTyK9g/PR/6NPFFshmq4WOJfYjl0gL8ewH3m8MbBQVP6IKuMqph/5rC7nt3x2Jl
         Q9LzqS0mAuyiVEd/SwA7YQ2SSTqOef5EkPMhzO6H70Y2PRtLFCssfIUOeeNh5uE0BIcy
         pIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678550; x=1793283350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYTy/UTl+vBn4EAGrIttzpHzPB3aaGAMqMkXs9OYaPM=;
        b=r/9zgTUfPimqXNyoJt7w5kKIL+oF3kZ9qiut2gBbCWxYF24fBuP8OaXKZAyQrtJwHI
         HrJFtsNcAEQokANELHv2S+T38t8kS4xoPCQmqZOEM/WnorXztHewWmwavli2MJpQEE4T
         IWayVHAyjR4nR7cucrcxclW8/SB/0+z6fYuPMbodHmFENG14IG0w4V+vFQ9zK4OA2Gnz
         wmyYgzyDE3xsz1P9XTDL7wwEbRJkZ8CiyNgEsN+MQg3dS9JQcPx+O7sXWJ96Y5sUTZUW
         1nhZPs/U69/6ZEqXvPHS1Lq+Il1igZ+M+WGR0OKWjJKQHwUEdlTsxJo3PGnWclx5Q9QQ
         Npbw==
X-Forwarded-Encrypted: i=1; AKwUvBwewKYL+yFdKYV6duB6KPkQonIfv2KES68ZxUzfAGCDXl+mUQs82XpaOmyMvCX0smhMwsk=@lists.linux.dev
X-Gm-Message-State: AFq9FYIBxxzNty7GmunEitPyYoRDHunim7o5i15wcFIIiflWmySjfqPp
	4OVMkogQ0xYCXDkeNhL0Xiq5BotNWVB804xMLQjFe9r284qudbgN1kN4
X-Gm-Gg: AYBFou39LhykNiY+q93NuiWXrKZhGFlDKjKe3xKD/hxK8XOQNld0w1zZpOezlLcuf3a
	JELMROdGJuELHEZJPcCO3xBCk/2mwimrjCFHeq0pMVRhNdx50QS6L0n2hETmZdgcVdZdgGXO2c8
	BBDkOKdcBfpEQNt1AL6nRWjDtLbjnOVHJuWdTzQ7aRMHDYrwr38CMzMJyQ3FpBACsJsnDn6kc0S
	gSkwfc2tuw0Z8s/DUQGMruu43eMwGzqVOw2U8LLrBp2JoJL3k9vu2u64kE2y+TX8GsDpH+Ar2ED
	jbzzrDTYdxnXAXl33w/jWm8l6vcQgVbH7E817+RnVW+iW9IteLETsiXnTw/CwMhsrATehF6bhAB
	26I3GUkT7sxOsZ/JWHSzlBcaldJPQ0Sv4wFkS0I7nhs0rmn2ye9RxhXdHbQ/cI743j+8nXTER3a
	snvgLYzh+22Is1l9sgPpLbBzI5KGMO5zFGvlAD40/ZLl9zqujv3dGzl/1XKvbi7l9pXzkLCuOwT
	ehiPo7+3p0TgIq3tk2dfWTH6jRFOXAXFOgAWta3ToISbBjufyckRtwcxjTj+pDPAZ1jOtp+6M7N
	Mx5GnkDU9AgPJsx/9otftZhplUcZMldwdLrX5eAtalaIpQj2YQI8uO8=
X-Received: by 2002:a05:600c:34ca:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a1fdd39e68mr111050565e9.28.1792678550121;
        Thu, 22 Oct 2026 07:15:50 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203add62dsm82627145e9.2.2026.10.22.07.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:15:49 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:15:48 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <ew6jybymalb3d3q7hen4qubefipnofcfzsrzyjdajuagw5fnov@b2oe5mjyz63w>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
 <20260922165846.GA290956@francesco-nb>
 <arLJl3jyyytfS_Qw@SMW015318>
 <20260923084111.GA460930@francesco-nb>
 <arPrD4TDYhjYxFGJ@SMW015318>
 <20260924101308.GA45659@francesco-nb>
 <arU0sLhGG__lh98n@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arU0sLhGG__lh98n@SMW015318>

On Thu, Sep 24, 2026 at 09:33:20AM -0500, Frank Li wrote:
> [...]
> imx-uart<n>-mcu.dtso. similar case imx9-mqs.dtso.  Uart<n> is cross while
> imx famililer.
> 
> Frank
> 

Hi Frank,

v2 follows this. The UART overlays are now a single shared overlay,
imx-tdx-uart-mcu.dtso. Each module device tree labels the UART it
assigns to the Cortex-M core uart_mcu, so the same overlay also covers
the Verdin iMX8M Mini and Plus, where it is UART4 instead of LPUART2:
https://lore.kernel.org/r/20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com

The Verdin iMX95 NAU8822 BTL patch (1/4) moved to the shared NAU8822 BTL
overlay series:
https://lore.kernel.org/r/20261022-imx-nau8822-btl-v2-0-b4221ed43650@toradex.com

Best regards,
Ernest
