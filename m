Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69E2C6B7
	for <imx@lists.linux.dev>; Tue,  2 Jul 2024 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719917777; cv=none; b=ETmRAXB4mgPshWmSvySzKYC+LKUGPINC+cIQ/8Gzf12do//C/zJEAiwd/QvJKI4tSP5bJ2WT3DNAA9val5ldOGiT5bM7XTRfjxtAeK90iOlCG4H4+AOejDOVkX1orXfuXKKycUMIgBuUKPsaSmzWT7rN1uzUhHbYCf6xHyuOrPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719917777; c=relaxed/simple;
	bh=+zG/PNeN5dOPIlWsfsGJREHjS56Cp/F1XPGI72hFguU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5l+S3CCIQMib+2P/6RkQziZ/easGEblE7CtGrK/UPT7Ia9UdYSvvSeVY6rcq6gVXoQXc5uHMJeu258Ofo/uyGKyPuvjDLQ72Wq4srTmNVQ6Z8IieonLXvuF7kmyvwr5CCDgbwZnir2WiMvmws7FwIEfyH8Z6xq3eAYf9LL19Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WY3gQP6+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WY3gQP6+"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec4ec518fcso4251191fa.3
        for <imx@lists.linux.dev>; Tue, 02 Jul 2024 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719917774; x=1720522574; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zG/PNeN5dOPIlWsfsGJREHjS56Cp/F1XPGI72hFguU=;
        b=WY3gQP6+5iFaxBrHeinm4rRZholy6OWkIjCUoUN+A3TDzPrSO1+hbzIzstchnCKJDz
         WYwN6H/bof9IPcFrSRFRKIvyYbpgKTiQr7tmkxEcrUABxlsZu1NJFDai3f/0wZPhJLwd
         E8kMxerz/7sBbkZf03hc9fWSjrzc1JhM2Un6acFmcDQ/+2JB8eSQPTge13/rBvE/TcfB
         YDH7/Q8bqJnvBFi+Kq5prLCAwA98Uac+L6yyOZMgfvIQEWULWm6EPxYCPFsFI7YndJdi
         OB8eP6fiO0gnT+j5D8WYPFtv0ahgXuzRrEO2N/uUCWrMlCBAwl2thKCduDG9GhMQoBVL
         6YxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719917774; x=1720522574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zG/PNeN5dOPIlWsfsGJREHjS56Cp/F1XPGI72hFguU=;
        b=u0eDv39ovQzp1s30aPyEbC6wptdYneVX+ukNIMxxvdsRnf6jikRF5NDRTtU+XekMn5
         VIHuDcU3kAg97f46zbkU83Z+rLd2KBYyKvj04cdMemRILVIqFFOUAIr6nSdqrV0EdB1/
         JRnw6cUtc1DPUsv1UdaFVXcWNBCrfw1EbPVHU/hdMj3hVOtbQeYZu6JU/Ent3eobKCZH
         OZLrEf8VAGs/SWMe1EvgBmmq3u2CA7cvc5FW2jExOcUN9wRVqFHzxqzyz3k496wFke9a
         4iv2tOxE8BZzZNeC/j2zbfZbKnU9Vr5krfq9BtOfRkVEGwamWQ/c2VyolahfIg1r03lP
         isPA==
X-Forwarded-Encrypted: i=1; AJvYcCXdG3VJ9iWU6MJEgJiJuQRzaT+b4p8PnBM1zmdjOvM5bsOt2UwyyXtXF+JSdp1CQQJPulzfz3Lv5H6aLibmEa5Lbe7j
X-Gm-Message-State: AOJu0YxzfNcQBapnJv2e8jM9wg8pmkuV8FoJNCQYr+7uzpPtSnoluI4G
	MY4aLgqrX50M7xLJhrOcUonXvk3yy03ViugqhQVWnT7SyHn35L+JKjYfkFTgmAcIb0jpH1pl9Wo
	Lz+ni4wEbYsLZKMM5O1Q6nrjBZ/w=
X-Google-Smtp-Source: AGHT+IFGKnu3LmXfbShEa73SwxFF4gyNqwctQrEMh2t1spWWecMRMfRQcnyixZeqbze4/hjOou+RQQKGd4uYEnYJjWw=
X-Received: by 2002:a2e:92d0:0:b0:2ec:6196:55e4 with SMTP id
 38308e7fff4ca-2ee5e357597mr49483081fa.2.1719917774297; Tue, 02 Jul 2024
 03:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701-imx8qm-dts-usb-v4-0-03cdbc8c44b6@nxp.com>
 <20240701-imx8qm-dts-usb-v4-2-03cdbc8c44b6@nxp.com> <ZoN90rHfpK7niqEr@dragon>
 <ZoOAjSUp29DBhY+/@lizhi-Precision-Tower-5810> <ZoObnDqMd2EL4W6F@dragon>
In-Reply-To: <ZoObnDqMd2EL4W6F@dragon>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 2 Jul 2024 07:56:03 -0300
Message-ID: <CAOMZO5BigqCqfou7NAzeVZ0Fp+AJQV20BYexROnaCJwU+etF2A@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] arm64: dts: imx8qm: add lvds subsystem
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

On Tue, Jul 2, 2024 at 3:18=E2=80=AFAM Shawn Guo <shawnguo2@yeah.net> wrote=
:

> I do not see "fsl,imx8qm-irqsteer" in the patch.

I sent a patch for it yesterday:

https://lore.kernel.org/linux-devicetree/1c1e3224-1b3d-438c-bce4-5614329246=
2c@kernel.org/
