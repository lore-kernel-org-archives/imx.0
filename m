Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D95C1A08B2
	for <imx@lists.linux.dev>; Tue, 27 Aug 2024 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724760650; cv=none; b=X/rKqDsaFE1EObwFsC3T9Urdx0X5Po1U5i+mAkf4HXlGsneZHykaZSFFPB0F18MqBfoTIHEhSHy4bdzvvnl7d74vD/g14h4jKS4OBh1leHrTQK4WRx6kdaO+HImlpeQrk9UdIPXSvTSZ56mu7f3nRqSd2a34Lq4PO2zkLVkeJbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724760650; c=relaxed/simple;
	bh=AQQY0+eCtpauFdwfMB/DPq7vz6WsH8SVHCLuIW7R2r4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzVl6oZsX65kC30Ev8a2OWRH306G3nM3eYV+YBJboGsQsU4EH57DQmHlKMlaT4Zu9FOb+dIRCBmMl5bDn4Qcw/3ciItQ8W9ggbeM/maNDRW5DKsOuaAOtAMz92+ebJhMU1jGXv8wszk4jVAlyflu3FeOLR3DMWaYcDnTHHHZzt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=al1dqXLO; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="al1dqXLO"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso7486016e87.2
        for <imx@lists.linux.dev>; Tue, 27 Aug 2024 05:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724760646; x=1725365446; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocWvo9DzoExmIHq9UIiaFosa4hw3n9psCH8ZfRs9xow=;
        b=al1dqXLOkotNUMbAfzNuq82RNkDWEzre+1hIrQMjquCCBPhx821UZUGVH98rkJ23Xp
         IJ08MuKwz1RLLTAmHKxKrAyUuiNhZ5wPVvkG1SgqALlUVNlcGUGC2UgmblDSRRc7H6c2
         JtAD1Vcb+OXW3T+7h9pzq5RGbS0CysfBO1UuEYZi5SalBnSciWIzlz5nnC0wfVfrGFj1
         hwvUnHfpCTg/0QbAfOYHe84UhaokYRoYFfZTcz8jXxQIMEgAgpaXWuQpaELV6gGTWQfR
         7X8emYhsoAv5DVVevGXvRf/SG45WcndvqTwArmaiGBletqlR9A1JoPOVUa7m1ILlAk6n
         nxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724760646; x=1725365446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocWvo9DzoExmIHq9UIiaFosa4hw3n9psCH8ZfRs9xow=;
        b=J6xqavx6RHAf9CeN9ysXPxU0NWqo8LB5zI0khyg3gzHPRtv2SVr+FFhJ8CYJJtUUkx
         ByRMkEVwudDnSV1PzBLGjjX+QJKLozUtjL2MupY+3nIGpwKt7eT3bn+X4aVyZQorP8IB
         Qo1+CXDon17pTodupG0hoALQWNSpDOV7YZ3dXpIZe8l2YcAnytnsD+A675c/hi8wI6BV
         +nYAQ45bxCluxcjWYvfFmRBHvyvGjomUXJ8H0BR1lKZV2ThPL018tEI/hQVb5PV+XIk3
         ypVU4XY2JIe3qHd1nDqtFoRx9m9tk3ysggoXaUn/S+VmyERbI1EyV4llPRVgmcUzKkqy
         pYcw==
X-Forwarded-Encrypted: i=1; AJvYcCVL7QiFAe//V6C0hB6gNmyDInCT82bHeSwxjXoeuzbV0dPnol0YRTfgYLCARwkWeFwXTJI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq2pIOAIpm7lwROrB91fB7sFAudPmsgJbXnVFq6ykTZefbHZKL
	/eQW9SwwPVCM850eTkF2u75K4TMxyRDrg+XSRVjNtHYb7I3NNzpc07hftGCev+xQbnIa1mmsDTo
	Ng4btnykjQ0EQcOLeKZBxFlQxnu4=
X-Google-Smtp-Source: AGHT+IEh5psS72JM5hvNRaxVWHrg402o8pnzLlLRh3KcneC/lRx90ichG0VNgnlvvr66dtMljeyh19iUph+sTp2ULkA=
X-Received: by 2002:a05:6512:6d2:b0:530:b871:eb9a with SMTP id
 2adb3069b0e04-5344e4faf07mr1737573e87.47.1724760646028; Tue, 27 Aug 2024
 05:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823120158.19294-1-tarang.raval@siliconsignals.io>
 <20240823-demonic-jolly-chital-fb4d61-mkl@pengutronix.de> <PN3P287MB1829E68257FC17F8ADA725028B942@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB1829E68257FC17F8ADA725028B942@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 27 Aug 2024 09:10:34 -0300
Message-ID: <CAOMZO5BUrJBo5+bEyBA3i7q9Kb0HXgRwu8J-kV9JbDMFcx-WGg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals Support
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tarang,

On Tue, Aug 27, 2024 at 8:16=E2=80=AFAM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:

> [    8.639860] fec 30be0000.ethernet eth0: Unable to connect to phy
> [    8.708452] fec 30be0000.ethernet eth0: Unable to connect to phy

What about this network issue?
