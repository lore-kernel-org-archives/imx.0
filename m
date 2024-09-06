Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C5C1C8FBE
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725617468; cv=none; b=hyfG0QVzRVprOwNkoD4GuTY5yi0VfBAR6WsulO2BkTuFPTP23zyGGuKHusNsmaMDAjA1dd5hUAxKqN+mGlGpVOFE6Gqljdu9/INdhTBaiaQEb26z99vh8On6ZtB5v6+lTyxFgohmVi/H6F62mndtoJIZdT49AfzDMhY6eYEXL84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725617468; c=relaxed/simple;
	bh=Wrsol6aKw9uVdTSdlWkD5Y05e14U7sz6vsblZrfii2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5LPWT78XnQ96Vjb8MtuICWGFCWTWKzdBkUq13A5OyS+FCLz3pBk44Q4xxe/GO/MZuoPRJk9PAhRzt0SZ4mhcn7AMOFRjJWs0g47AYXxr2M9XqH8gaO3QMj31hH2JOrYkjRzxBWlgW00NnbEBTKBl76IDIk58Y4UAM1P2eZyQY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDKGv4kW; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDKGv4kW"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e1d0e74f484so2253947276.2
        for <imx@lists.linux.dev>; Fri, 06 Sep 2024 03:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725617466; x=1726222266; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wrsol6aKw9uVdTSdlWkD5Y05e14U7sz6vsblZrfii2s=;
        b=WDKGv4kWzgkdMNnXm8C7KOwvensojwKfT+HUMComDcEVYTgISdeLFVNi1iMdPhleVa
         Zo59yL1PInHPYjv/S6Jyix3TdoZ+Cdt0dExSMmTSXbTZ3EBZq/k2cqRKtHz+PkdD/FJX
         fg8sbvKa75PWV/wEnETUYFCGOl2ruZiU2dzxbEKx45PlBq9GsouB5eN5q9iwcz9rFuEY
         8mhgGu4qb2TYRZ1ojMfUujIbaMMYMl/X66+ivJTENt6B/IXoJ8iQH/dY2P2Nb0FX9oIr
         kmYPu0/0WLQ/2wB2cSMbNo6REGPrtcEZFcEpgGkprEKZOAxN4Ih7LJshYNtBbC+BY0b2
         PE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725617466; x=1726222266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wrsol6aKw9uVdTSdlWkD5Y05e14U7sz6vsblZrfii2s=;
        b=u3JCuoQjvETwZNd+Y7sEkTCTLQenmkqiohPTCBF2sA0Vz6bU3kpnwaK+LLn46We2/Z
         9Q6HL03u/q5QSX9MKpGFWmSnpBMZUi5qXxY6c76vY0GR8HdWipMNOLfOzSsvuqC3nspP
         4qWNJ/Dy4WitbKCrH4M/+DJkKGgDkdqGBVtRTOw0kOWN0P2NNXbqiVywILGHF5DeCoqj
         ail7aBQSmdjiaqKHzDoRHdfdr91dbTpUPcMflopgbhClw+YOv8Wz7bSYDa5G5FI0h8uB
         TOOm4FeV7SdaiglKXFWelGvEyPZKqsr62nkqxDG+eOOv+MYsSceGnjAuX57NFtz2+xa6
         PFMA==
X-Forwarded-Encrypted: i=1; AJvYcCVDc13l881Y4AyNpPixDzrGDagWrNYlTLayTSnCPnBG4KE/RMOvHGY0GcrqdOHCPS28T6I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoREASUwrEquFSaKq31m0i9/HOu2x7xFoQPvYppXe2JPaVheKW
	bzWdVb0L8tye1bwb/JHdWtL6ENOTpRedbboXMwnI6yVk2frjV5iM/c97CCBVr1GCWvNR3N8tkmK
	ek4k1Em68bkkh3BPtX8ggOdHIuXi/SNks
X-Google-Smtp-Source: AGHT+IGWcWAX0/60a3kLYTOxWZ/RBDMXvA9Bhh0EDGWHKhS2U26NaLeBKk/71kFQtwBOx2YojF+fr2635MJZT3i5ArA=
X-Received: by 2002:a05:6902:2290:b0:e13:d0af:b1f9 with SMTP id
 3f1490d57ef6-e1d349e6433mr2440672276.44.1725617466380; Fri, 06 Sep 2024
 03:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240830085441.3589713-1-lukma@denx.de> <20240905143645.7946fb0e@wsk>
 <CAOMZO5D3y1_-_TX_a7zuYPxdRKGHGN7JFwWMNe_dtS6i0Rx2jw@mail.gmail.com> <20240906100248.39156474@wsk>
In-Reply-To: <20240906100248.39156474@wsk>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 6 Sep 2024 07:10:52 -0300
Message-ID: <CAOMZO5B5DQGdW9mnVPzHcwXU824WFrxEpCBff56Co23RrYadKA@mail.gmail.com>
Subject: Re: [PATCH v3] dts: nxp: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Fri, Sep 6, 2024 at 5:02=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wrot=
e:

> As most of those bindings are "legacy" (and already upstreamed) now - it
> could take some time...

I am not saying that all the mxs dt-schema warnings must be solved to
get these new i.MX28 boards upstreamed.

I am saying that all new boards must have an entry in fsl.yaml.

See this commit for an example:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
Documentation/devicetree/bindings/arm/fsl.yaml?h=3Dnext-20240906&id=3D7dfb4=
97191f0d87c3b3ccfd3039df4c03d6769f6

or this one for the i.MX28 boards:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
Documentation/devicetree/bindings/arm/fsl.yaml?h=3Dnext-20240906&id=3D8ddbc=
7b9ef9862c34117ec552f00a054101ffc36
