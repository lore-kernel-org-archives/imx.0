Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCB7190664
	for <imx@lists.linux.dev>; Tue, 25 Mar 2025 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742892558; cv=none; b=Rtb/8OseKy4pjhwBnOKhw+0ms6bYVSU5DyKozOe+pPMTQTb3g1aiorwq0addpy720wacqS/RTbWb7G6wBMoaJcLM2iTHySkRwNzzz7oYpJzVUi7RS7w2ZC2oSaOf1DyW+dd91zgjuWyj8T49+N9s881423qIGq+XxL+Ufn/eNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742892558; c=relaxed/simple;
	bh=UTMqa3/iThHUj62i5Lna3n7hgfqWAVpg9kIVXMcn2OA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8nEc5oxxP3gfarTeoq14507Njul2d9iEZoWApuaTJ6+y9xQtRhKMB82gnfZYWT7NEKuXUn1COCH2PJo4nsyS0FGyWLKTngsYz8sy/NMAALyURHpMBGt1Kp0UJix1EHyox0FEYA036Q9W+0dilBKblUQDN7i7wwKnAbPxCW+IBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNxrV+Xj; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNxrV+Xj"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso9204320a91.1
        for <imx@lists.linux.dev>; Tue, 25 Mar 2025 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742892556; x=1743497356; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTMqa3/iThHUj62i5Lna3n7hgfqWAVpg9kIVXMcn2OA=;
        b=JNxrV+XjegLuwHsf+ULWOWv+1x3F510240t+HtkSlZp6zAA9pXbxvgPpDHh7GpnayJ
         RcnSnLDejPlBBM2O6vHxLiB5RSViNXLf14tdgMksgDBDMVshPprDwf8qCUQO+/+c1Gok
         /vobQMGHew3toftFaUZoO+b0V9sOGgs7YAKxO6EOVgLFZc/p7OdUPGvuAhqovIElJZK4
         3VfMiaHP23YOi28hnMT0xLLFRSu2zyQSM9W8oc8ejESRcZMqPfYUlS9XWiaEgUGqjwOU
         i8cRU6HEzBAO7pbW2bWxTROKVz2UzaAakSAly+qplvIiwKxeOqAYoeLPbRw9DXeMcrPw
         UMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742892556; x=1743497356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTMqa3/iThHUj62i5Lna3n7hgfqWAVpg9kIVXMcn2OA=;
        b=BWTOY8Z9rzUctWZtLmGPW7SvdJa1+FVB2Jd+2Rjf1Anivhq4XL+vyegJpl7CRdYESy
         ojsGpQ7DIW2yBvQ8IxaXDSYhP4iejLbKxitj4TSiBUBbx1LQaovjdRqTIYognYVy1ISN
         2QHDtSbAklP8xjAjS7uJwuKZfWIaK13UU4V9Mij+pS6w2yTdxREphSmNNol61rDyfAZo
         /l3IN9KF3q/YLnUsOnz3TBZOtxkUZL2cK7V5ncFpG5ITJ1mqx6Yu5BSfPvaDvOdC/Cr1
         I96lzKrgur0Rs1DYhURHuE8rfAlDY9lOtR9OFQ0kBy6zj4Jkn09pgp4gOj6pgM00TVtD
         09kA==
X-Forwarded-Encrypted: i=1; AJvYcCX/p9Lco0e5BSDP9Z3kxu10vu38WsvFFmktmmsSnxJdGvKYNzqcv/iNOKXkTbpQsGrXzQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYWhbz010zFU1fj3NV7EiRVCF220jzpwzKi68e3MlqLETWhzQ9
	0pMDjIqCyU1XYrnOEzZ1VLGtLrp+BhsVbxVcxKj2YkLYnFEgIVsWmjnsHAD0mPA4ao5NP/apfYl
	AF2XRgO52Q4Coi0uH+VPspugRVRo=
X-Gm-Gg: ASbGncsBYo5wwY5QhJSNzW5ej3dQSTHWa7nd27dx5pow+Iqc4v/3Zas1qxnRFUPbGeU
	CltaxSm1aUaFJgWqsC15cSSF80+Q16dIovNi5CsmxSB0pXixW1HxzUxsULA1WGltcPDZf3gzN+j
	/znbTrz6wLtZr78tlacq64FiY=
X-Google-Smtp-Source: AGHT+IGdUevWbt9B6OCFjrfKlwOyeQ+1e0MLr3UjHCkhv56/tA48akFvVsynr6iH2spJ/xGrmJk6TrqDw1VcLtJz89Y=
X-Received: by 2002:a17:90b:3d8b:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-3030fe855d1mr26348075a91.7.1742892555925; Tue, 25 Mar 2025
 01:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250324234013.140440-1-marex@denx.de>
In-Reply-To: <20250324234013.140440-1-marex@denx.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 25 Mar 2025 10:50:42 +0200
X-Gm-Features: AQ5f1Jp83_swMO_7jm3Y2fbbueh5o_M1drf9oc9W2FWr-Vtdud0qx3Z5t9ySw6k
Message-ID: <CAEnQRZB068dzjLmeoFdPtcX_Wc_Or0idd_J0OKi-UqgD=Lmcaw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: imx: document i.MX 95 Verdin
 Evaluation Kit (EVK)
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Hiago De Franco <hiago.franco@toradex.com>, 
	Joao Goncalves <joao.goncalves@toradex.com>, 
	Joao Goncalves <jpaulo.silvagoncalves@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 1:40=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> Document support for i.MX 95 Verdin Evaluation Kit (EVK), which
> used to be the Titan EVK.
>
> Note that the SoM used in this EVK is a derivative SoM from Verdin
> line of SoMs, an actual i.MX95 Verdin SoM is under development.
>
> [1] https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx=
95-evaluation-kit
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
