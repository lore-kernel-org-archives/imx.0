Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DE11B4138
	for <imx@lists.linux.dev>; Mon, 26 May 2025 11:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748258195; cv=none; b=hPIIVD4QFSU8aJj1ZW5Qj47k71s+d1JQAJDycBDL0w3uDoBzp7fxYw2BlSY7jvIERGSNZlZc/Yc+FpJ/NEhRoxLgu0A4tMyO3vGn5zaZcRb6fsN/Jb/bptIODG1sTvCVxBUQW1NIKzMi2O5S+8V6jLRLidmy7mEe/7rPizEdCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748258195; c=relaxed/simple;
	bh=Opjk65paFLJ2yocp1B1kEaydI6C3FZxcuvHE6R2phXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUA9p7BNTCDt9PMq5oUVNiElE+glXbCAmWVJpx9IsQ0jDEnzkERZgXp9gpPbpXtVey5T3UkcWP/SqF8oTjyF8OIyk3yR9ieo9r3R1AFq9TySylZ0bO8L3OHnAkFAVwyHt7XtZr+vunMG1SRqSucjUy8VEXUlwPXE39m22M8he0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N90j1qv0; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N90j1qv0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3115a6db4d6so626024a91.2
        for <imx@lists.linux.dev>; Mon, 26 May 2025 04:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748258193; x=1748862993; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Opjk65paFLJ2yocp1B1kEaydI6C3FZxcuvHE6R2phXo=;
        b=N90j1qv0WloxcQTbVXxR9zt5QYmwcAUyPY96y/jU/9G4j+Cyp86Vr7DmQqNtmoL8MA
         r1U4N+feVGS4N2O/XI8pxn5GKoi3zEKBZl2xhsc1hLf0VTHQ1AjM1ywi2LCdoJXqA7a4
         qXauYvRNw7xYv6qJbgaHs2Xy7/ldwkbj4D/3KciVBr+lfHRvL4bsxYpPJPf/svxaNbIZ
         2KtStslm9eRA11A+Rz9TyPFZy50Jbhsl+WWDdyQPt3Ri/J/i1mMp49uT5IjDZi7aGaf+
         bFiEqVGbP20ovP3FpiwdxQyPmhqJAaa59nP+bN5WvcDkD221k3y+L+yeZYAT1v+Y/RSG
         8dNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748258193; x=1748862993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Opjk65paFLJ2yocp1B1kEaydI6C3FZxcuvHE6R2phXo=;
        b=b4wo8Ti+qIZlif2tqON6gXOsXHhRkbLvqGeHLRp37cEoLIuOfF4j85aA62eqf4APiT
         4j0m4yEFVWmo2odbp5Y+1ZkYoYY1Dn/2YttZSWfIw4sxuVi/Vt1+WF8xwEB3u5QYeNWC
         tdaUkRoH6OirkhTX7Bb3aTpIyqPs3SaqcgZSqu81V0ODn0u/sfjtNQkOgvw2ul0CGvnt
         0QCqBDosAzUkxVWpuE+GQUK/mAWhvduc/5RwnyfPqbKdLRlbP7JwC22tWeBFGNM2QlFq
         ycyzwAMnVJeosMOLn94IGc8sA0yrWgMuJHv0axGRlYeDlBOYneJxZ+oSS6XShHyArxqx
         Ftgg==
X-Forwarded-Encrypted: i=1; AJvYcCVDxlQC9EiCnZ+MRP8OPIg+HRWeLPiFKO3IFQlJit4nzjpfVITPKUUU1PxaArTOpjhM1yY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc4cR2i3bROLOv0z3mkYFhDrsbWfipS155dLNZuXqXntzHn/0k
	rTYKMK0CyDP1OupWQjX7QrDw8CSiQjYa3ohg2jf/cO0yvBqrc73tiAEEPe7vd694FqNvNOMMiR4
	HdkSMK5TczVLY5Hwa5LavXsqo0js+pSc=
X-Gm-Gg: ASbGncsxNbI8g1X7xEAPfuDFYrRH14Z0OFtcn0khIam5tyj86EDcK54KR8c04FCzFFS
	gxAGLYzUaOVpu/7kOPutabm6hkZDVt435J5VDolN9NcBrO1VVgfYmoaq1a2sKsCTAoUeIAm4o14
	h64Nys3+l7U4K203rlfFNEj+YcvO/jEw==
X-Google-Smtp-Source: AGHT+IFtzvYREQF4e5RGyWZ3F4MYtqkkNGOvg9UsSWp9ip8U8N2Jl9OoCM3bMnVLyNovfB23/E5xH1xXxzKgvocOJGI=
X-Received: by 2002:a17:90a:d60e:b0:30c:540b:9ba with SMTP id
 98e67ed59e1d1-3110f0f9b4cmr14756973a91.10.1748258193279; Mon, 26 May 2025
 04:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de> <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
In-Reply-To: <20250526-fpg-nxp-imx93-frdm-v2-2-e5ad0efaec33@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 May 2025 14:18:15 +0300
X-Gm-Features: AX0GCFtcQ3gPsieet4uz43pbRsMbpHjmv7-rKiXRxjWLyoqRErH-OX-1hcUkpwM
Message-ID: <CAEnQRZCn0bBgn_FHS1Dn_p_gOraoLzU_1pLiyKoJTrbdD=LP3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add support for NXP i.MX93 FRDM
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 2:03=E2=80=AFPM Fabian Pflug <f.pflug@pengutronix.d=
e> wrote:
>
> The FRDM i.MX 93 development board is a low-cost and compact development
> board featuring the i.MX93 applications processor.
>
> It features:
> - Dual Cortex-A55
> - 2 GB LPDDR4X / LPDDR4
> - 32 GB eMMC5.1
> - MicroSD slot
> - GbE RJ45 x 2
> - USB2.0 1x Type C, 1x Type A
>
> This file is based upon the one provided by nxp in their own kernel and
> yocto meta layer for the device, but adapted for mainline.
>
> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>

Hello Fabian,

Can you also add the original S-o-b to give credit to NXP
developers who started this?


https://github.com/nxp-imx-support/meta-imx-frdm/blob/lf-6.6.36-2.1.0/meta-=
imx-bsp/recipes-kernel/linux/linux-imx/0002-arm64-dts-add-i.MX93-11x11-FRDM=
-basic-support.patch

Signed-off-by: Haidong Zheng <haidong.zheng@nxp.com>
Signed-off-by: Danwei Luo <danwei.luo@nxp.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>
