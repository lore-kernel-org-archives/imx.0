Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E93C823DE
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 14:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723042560; cv=none; b=VDlBGq+nUb93yYhxaqy0BptI0M5cPM4J72uoJPuz37NIYMrluJDLwzX9Z7Wxp8auY4R5OPTwYIB3fKKe2Fl2UbhYwMhsMmvEaAZdZU/H98KMNsUVIpzcd5N/k330PTpap1CMpyxSW+OxC/Q1cP9mwf0xygRnXApVdVQ0HwpptTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723042560; c=relaxed/simple;
	bh=xo9elGsvRTScVV4AackKBXuQzEuvaugfM58oKCMoePg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgZs6ifCtBw70NRD0CUvhDUw5QagTYTO6U/bT+2OVM2HLOlBRLxo3oWfHwIFiOJnzPgDcHlVVr4nUd3ihGUPoDrXBRrgCI68s3LnNi+kokKFbBcn0DD+LW6LJQekOiI7fkpDdbiWk0wgqPUt4SKab5oMGfrn8KyfKV/iDBxfw2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Axj8V7We; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Axj8V7We"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52fd0904243so202604e87.3
        for <imx@lists.linux.dev>; Wed, 07 Aug 2024 07:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723042557; x=1723647357; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xo9elGsvRTScVV4AackKBXuQzEuvaugfM58oKCMoePg=;
        b=Axj8V7WeYcZjTij3ak4oTChJwq80o0vEkoyXySWa2TpbBn9X9Qloo00BXPpu1VZd0Y
         lkoU2naNzc7K3pW8SVPSZiy+JmIr5Fg29b937OpDh/gaSMxaplIEROUyjiv8qtilE//S
         Cu5G3SPFRO121VPLEZ5ldn1hj5hnebLqa4PBljfqzWIUKOPwe04PaxfbQMGH+ypb1Tjw
         rV07aXWLFJJGWU9N8DiyQzWNS0/w73nE2RFaTB8ckHEYTHu7jmxVOVukKAXNzhPQS2m+
         wlKSUCLPsD7mjLcfSI9fLxchDnZhRrBMUG7m7U7WNiAiwdu2GyU6rijGop3KO/aHRYwu
         xqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042557; x=1723647357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xo9elGsvRTScVV4AackKBXuQzEuvaugfM58oKCMoePg=;
        b=ZUUN6mA6/ORe9pOGlzEBXc5YSPs2Ky+0J6Ei9ugWGSz0ZsLxnH8bEy15gJmNs5f9Lb
         PKylEX5QC8D//90q2UfB7W4HUsGPb8iw+NrfGaADQBh4kz/fY75YCl7Tto7lBNdawW7f
         DgogPoJwV02CLpRKkh/Bre2561buFkCcqpcGGdaXXgBBYhDIRtEcLvOdVmu5MruX/l2k
         RMl83NbxHoAPi4uwB27tt6bYkJEvo1cm1lZ0g8WaGfDqTdDuCc1fnmRBvRNZWC+K8mCE
         edUv5Y5+oHAC18D7OCdDPU1O29e0oxCAn+yFkWfY9UScI/WzwPINjUb++tqPSjCy8EqJ
         5Qxw==
X-Forwarded-Encrypted: i=1; AJvYcCXedXMCz9hH6MRyegiXLIoaoZ/JShD1Xut0dMBCBzUltqfRPGJjwQSi8Y0HjG8onxhWyXGTh5fLQqO8OK3aUzF0WcWl
X-Gm-Message-State: AOJu0Yx3p8l5zjYK528OAS5m0KYPdn4gYKS7mK11J/DokLGe3vHttlka
	v1tMS36rAIX6PVNsMtS8d9tIe6YVK1Ch+BKa08Ja0dstp16K/CY+D7MN59mNZC4f0+MlAml3h9r
	giz0B6VT5iDMikwXmDB8U25eXtOq1Tg==
X-Google-Smtp-Source: AGHT+IHH3Th5RBMef6rTaNUiMx4WFciYUZ75uhkrUa2Y9KwggP4leL8PFwqLHDptPjIcGz0f0QOC5ae/b6w0eGUBUgQ=
X-Received: by 2002:a05:6512:ba7:b0:52f:cf27:69f3 with SMTP id
 2adb3069b0e04-530bb36725dmr7964384e87.2.1723042556282; Wed, 07 Aug 2024
 07:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240807135419.248219-1-jpaulo.silvagoncalves@gmail.com>
In-Reply-To: <20240807135419.248219-1-jpaulo.silvagoncalves@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 7 Aug 2024 11:55:44 -0300
Message-ID: <CAOMZO5C-hmrH9J7=JKOn9cUi0bVa=dKhgsnzwaq=ttqE7A4n0w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mp-verdin: add HDMI audio support
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 10:54=E2=80=AFAM Jo=C3=A3o Paulo Gon=C3=A7alves
<jpaulo.silvagoncalves@gmail.com> wrote:
>
> From: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com>
>
> Add native HDMI audio to Verdin iMX8MP and all its carriers boards.
>
> Signed-off-by: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com=
>
> ---
> v1:
> - Fixed wrong "From:" for the patch

Reviewed-by: Fabio Estevam <festevam@gmail.com>
