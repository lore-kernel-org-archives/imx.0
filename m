Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66243AC0F2
	for <imx@lists.linux.dev>; Wed, 24 Jun 2026 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295419; cv=none; b=ZFigcVLbTnbtvqB/iuzEG7pH+lgeHbafds+jCH0/QRSRP7rtjpMxC3n3uSXS//0hiYhMfq7LgQBlqw8C+lYRcBtvlNfGEnCxLLMFdhWehq8OgKtNB9IeFrOTmbp1gvBadRp/DhtkTdEwS8y6+IPEHQPtmphIMCirDfXji/j9my8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295419; c=relaxed/simple;
	bh=YLPnuSbTUtk9C6D2Ri+56mDOfZq8A1p//3CrjQWngy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ds9R5X88SkTk8KRx9oGUwjE51NLZQtvdKftAbYsOQZzoloHrgIpJONKa79MHCiZX0GKsJlL2GqIW0OA6nEAWHF7yQu28cPVkkiIwTky/iJ0DVxamKGBtAAXyMvWvHgyHPtS1hyrI6ESWlD63x5/svkWf1hLRWJh33VehCV2taLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sffm5eOo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sffm5eOo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso4129515ad.0
        for <imx@lists.linux.dev>; Wed, 24 Jun 2026 03:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782295417; x=1782900217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gb3l7+RmaQj62IRizU/FL/p+5/dRuUnOWMIn3BevCrc=;
        b=Sffm5eOo/nR3D9tjbcso/YKOttXXdqfW20ymJ0thYGddqy60hdSxNh/1ErwCnTzbSE
         zWhZamiK3uMjdVPNb42wXZb7Axs2joTSqcyE9xY8CqWWPlFywKqF0C28YIXpj9TR8V3N
         nQ1AHKOpvw4A/Pa6hJz9eT5T57hI/t3ade3meTgTWg4PS83l+ZuK0DSleF8e7vSVab4X
         DCK7BDUtpyMFQJ5Y7pxfiXvr5DoFW4E+0tiBJuGbH/5OV2tbHleyVFJvMlg6GNxyFJbL
         lL39+if0LkEBFZ57mOD8uHV6L8Hkf4P1iRqq5gTlU2dhloJKIW6fK6fZiqqUZ8cuqqzr
         vfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782295417; x=1782900217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb3l7+RmaQj62IRizU/FL/p+5/dRuUnOWMIn3BevCrc=;
        b=g2PVIM6YJCKnnIfk+p648ydCWCDsTY/uauvc5DOiWldJse8a2Owrw/KOwq9WU/OLDy
         bQQl7k3LtEiO3MIxAH78L47we/zQqNJoAlTqm5tCPQxLt5rMuxdcXblu0osXYQ1UhYON
         9C5hShXr94z5rgtUJMc3qs7To+Ka0UP/1pNYKh/ppPeLpILeT3+OaHd4MVucmfYEUByD
         PpvQkAjk+uqShcG0AWNRjY6w5iKQTIOcQNoDRzXOWx/dmdmPLcuFrA2qALJyst4BwBnf
         2YmMP40QtWJ1QZto3mkZRyKFNSlzB3MEwosws+Yv6BCjeGNBTScwZ8z8e1C5GG0s5jr8
         1jkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSJPldIPLuyXPPZNz5OAgsAbn0LJ443cFdbuLszkLtGSIXIUEIuX1vuIf0UAwEsPc8lMo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yykm2ryd8I/MW6JS3bCJRaAJufqbfEIjmpkJr6Fc7+g+KksAT9+
	NBP/LkMF5/T5NNwFLGGwmnahwEE4Zr5xrJyddDLk+79nhOxqXmmWGPPwypHDBQf+
X-Gm-Gg: AfdE7cnO7bdUV/qzpEEL8Ap+6PsXmZE043inpkV2KooYRHCnw49N+/+ewP3KsSGUqnu
	jKzU/7n8r3KGjImDmu9dEEJuVxSzTTIs4dyCFNuWckipuo+jRb3FNOXG5v/oDsObwe1a9ptd5gw
	w/C0WyPxdzeNif1536BInHi9Jrz8EurCNTCRTjEDjFIsjxA2Cx2o+svBEx7uKfQZ7ozlN6l5FJU
	YbuD+7EA6dIQU6HxvffWrGmyuD85qb3HTvhp48zuVe0pOgQt3xz+c+rAHS7O6XNRUp5qhKy5UXa
	64fhzBl2wjb24gNz9iULfm8v3oeLkH2T2inVvf9wJM35a9GS0xgm3xLJUCtAiYGiq/EsIP+zvd/
	5t/L59PCfJP3A1s1KDK4Nohtf/5mE6BERj4LTMBZG95UD5D4hQrmF94KkgNq1J01kgRywlKyjX1
	4BTfdIOalwCxRCUv3cPdtp2rA/Or2jOHfpGyFQ3mgaSu1rd7cHIxYhg2uJUSAUDjDhJ0zMgiBr7
	0OpYAq3cnUtBWZY0JV6TUyfy7m8Jg==
X-Received: by 2002:a17:903:228b:b0:2c7:ef3b:e17f with SMTP id d9443c01a7336-2c7ef3bed39mr3258385ad.36.1782295416767;
        Wed, 24 Jun 2026 03:03:36 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([115.246.20.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfe785sm126061495ad.66.2026.06.24.03.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 03:03:35 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: victor.liu@nxp.com,
	marex@nabladev.com,
	daniel.baluta@nxp.com,
	Frank.Li@nxp.com,
	shawnguo@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Subject: [RFC] drm/imx: upstream direction for i.MX95 display support
Date: Wed, 24 Jun 2026 15:33:18 +0530
Message-ID: <20260624100326.413699-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is an RFC to settle the i.MX95 display architecture before any code is
(re)posted. It is a question, not a submission.

It follows Marek's earlier [1] and Liu Ying's reply there proposing a separate 
i.MX95 driver plus a shared helper library rather than extending the existing 
i.MX8QXP DC driver (drivers/gpu/drm/imx/dc/). That question was never resolved, 
and it gates any serious submission.

The implementation I evaluated is based on the existing NXP downstream 
dpu95 driver. My work has focused on bringing it up on current
mainline, DT integration, FRDM enablement and validation rather than
developing a new driver. I am not proposing to repost that driver as-is;
I would rather settle the architecture first.

The current dc/ implementation is a multi-device component driver with one
platform_driver per block bound via the component framework. The downstream
i.MX95 driver is a single monolithic platform_driver mapping all blocks from
one register base. Unifying appears to require reconciling two bind models,
rather than only adding match_data.

DomainBlend is i.MX95-only and sits on the atomic CRTC path, with no
i.MX8QXP analogue.

The block decomposition also differs: i.MX95 has
dither/hscaler/vscaler/fetcheco/fetchyuv/domainblend, while i.MX8QXP uses
fetchwarp.

There is also anticipated divergence which is not yet upstream (i.MX8QXP
prefetch/PRG, LTS and tiling modifiers, and the downstream i.MX95 blit
engine), although mainline dc/ is KMS-only today.

A single parametrised driver may still be possible, but these
differences led me to revisit the question before preparing a series.

The ported stack is functional on an i.MX95 15x15 FRDM with an IT6263
LVDS-to-HDMI bridge on LVDS channel 1. The DPU probes successfully,
EDID is read through the bridge, and modesetting works at
1280x720@60 and 1920x1080@60. Weston and sway both run correctly.
Tested pipeline DPU -> pixel-interleaver -> pixel-link -> LDB -> 
LVDS PHY -> IT6263 -> HDMI, using JEIDA-24 mapping. DSI is not covered.

One question for Liu Ying is whether the separate-driver plus shared
helper-library approach is still the preferred direction, and where the
helper boundary would be drawn (which blocks/ops are shared versus
implemented per driver).

If that approach is still preferred, I would be interested in working on
the helper-library extraction. Before spending time on it, I would like
to understand whether it matches the intended upstream direction or
whether similar work is already planned.

Likewise, it would be useful to understand whether extending dc/ is still
considered preferable, and how the component and monolithic driver models
would be reconciled given the differences described above.

Thanks,
Piyush Patle

References
[1]  https://lore.kernel.org/dri-devel/20251011170213.128907-1-marek.vasut@mailbox.org/
