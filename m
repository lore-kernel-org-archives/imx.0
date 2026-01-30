Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF13B1D6AA
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 07:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769759160; cv=pass; b=NLXvF2pO4RPnbRhre61/Al3I91DmCfFC9IZia9RGF8rf07Dy5v41vR8wPuAcq+G3Kba7s+igg6uumAYoCmbXdcjorniK4o9TYKgUCMQ8RJhJ9j9tZA6OcTB0XouZwFTUHIMFy/XEiGWejkMs1aT8uOxGUUXSufz0DhPOQt1n4no=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769759160; c=relaxed/simple;
	bh=D0lQ24z3QkWXtm3ZSm1CdzuLXfMpxK4AhhZ4ocm6ZYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWnnDWsAU9tte9VrzwSuYEFh0qVzQfBZ61jNLC2kuxEkIyHO430hKotExxtMTxs6TFErEs5Oi2Z3oBrcwj2hKgDDIHjIYoxuFuyVViCEO4SFzm40Y2HlGUWdL/2tKDSWg1xAsBPy62D0WBAXYMeRd+oAfEtjsgPlmHaLRbGROnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV6ssvlf; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV6ssvlf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c93e0269cso1790469a91.1
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 23:45:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769759158; cv=none;
        d=google.com; s=arc-20240605;
        b=ZSGvD+gwZ8ig3ibBBOQeSeZbvtdKsx7moR71YFt0mWwuk83wAqY3B5lyOtRYcMU/tp
         eKIbzSfgScrUIxFv3blmO4Mw0J0vlNHumbps5eY33tdqT1ka3xCC0Pa80OYa4I8dM6k7
         Iviir6nb6gR5VUlhFCnM6AFbrvXqHach470GmUommyoKi3B1B2qfTOa89BjvfYHGLiE9
         mxiUFnSw5PEcBxwhU3FmRhRT1J959CZLgQvyAEO8WJm3PxZhi+YWnRzQSSWIFyJXVLvQ
         nS4DuokQHzZpSiqDY5IFVyu0FBWhlmNjD7uT1ehLF4AaHjWK3zpoDlOKNaDlZG8OLKcQ
         NwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TAKPIgQHJLSAdcHdDw9QZcfJJfsr09DFKKKOpfOD4gw=;
        fh=ONJur8WriAEkEH3Nkc2ejHBFz3a8copy4dZuneNtp9w=;
        b=E6Pb/3fqhC3Bffp+5WypQkou6pJ5UAFwnc2fiEfpQK29ETx1OTP8AiTJITrTdiwVH2
         Vqza9gvlVZXDb7X9xQmQyrvCT2Ue+z5f9xbScInPdRFL6v7sb3mckA/1GVQAB2UOyGkF
         vPWvwDcsTNhJIUVn4G+zuNKH3Uo9qL+axJZY7rSzBYd0cL4dij651u/BkvsYFvteg1w3
         DsP/MG/dOXhSWIlPUQqN6bP8W161aNKBtdt6Wu97+seXAv4+JwzCQk8rU8E1nGclbqhr
         LOA4BvOSbFx4y1Sjsml1ZI9pCaYSvToDL1ENniSrp/gX3rcGS1BBkoTHC+YpJfcxU/iQ
         PP0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769759158; x=1770363958; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAKPIgQHJLSAdcHdDw9QZcfJJfsr09DFKKKOpfOD4gw=;
        b=eV6ssvlfhPhrZ5OgfGZpkEvAyIj5e2Xf6LjvFSmmddShFOA/uiqDRYn4/odnZAWTDd
         fG0GLev4HJcfGP0w9/qx7R7tWKBSI626WRz74ciQwet02fOeEempWty0ika1zqbrljGY
         Iyb3h4LgIUrIweU//DevR10lwcopjtojejXaYcGTGETAHyEHPC81winytqnxPRVrrIuS
         5SWnA6yh7sFUDzihiSj3KtHBOZ9byArfoATtsL3b/tD+xS68mCmr+8r4wAAO81xXx/Oc
         tkk5m8JrBapmqwrzfNPdvUM5F+9cfyFrEFKsVy+VTxHetBR700dXRzxNxYFwxJ/VrcdI
         M3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769759158; x=1770363958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAKPIgQHJLSAdcHdDw9QZcfJJfsr09DFKKKOpfOD4gw=;
        b=T2dUF0G7vlfT6BKYso06bHw1fge3+kuOFgEcI/kuoVoXbYGJuUOYyF4tq4IUUUYQpl
         RoohQkH8l/wcBeJ0JYg1invwH26VIDBXzuM7lURGKkQxUC0g/2UIxkYC/oNjXMcwe0R9
         Gkb/oo9RrKqTlAns1l1/PHlv5t6BDXdGmGVj0ihu1W0PMz/0nkZ4/bwXsPN6ELNmxK33
         5cL2qq3iAziknl+5bpHJQaWhvgtJ08f6o2lzKqh63hKM0vkWrcwVCVJTZSLc/WdsvYJh
         qnsL5YLkJfPjo7gX3UsnJxCqRIYefqXrwD4N9mi1CdKpq7ImMX30oU6oXNdKE8+hBFf2
         HW/g==
X-Forwarded-Encrypted: i=1; AJvYcCUuy/JdvwOVeSS5dLYjCva9Tlok6MwNHvHOHm6LD02ZitODV4TNCzuIuT/MFDwo5MZVRXw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuhzgPgw9PY5zZ42t5JWwByCLFKOwjoIHiPjg22IePp2GfyCyD
	KzkyfSZnBsdr+930ZGxm6kinURSxolRE9ksp4CIH0J7ovzzgpVPXFK6ZxE1ZySLY1Li8vBI+KNR
	LCXlVio7xbTIjOwSGjWTnhROlTo78Q14=
X-Gm-Gg: AZuq6aLLfPBf4LHxa/ZQN9yHVNp/rQa3dWMLs0n/HzkXvy8Eu5YFAcRFuD1py3oM2df
	hekmIStcC8b8VZbVUOkknyGRf/fK+6P2CqfixdzwgIYkV1RZ9E2MNpWs+DPg38hAk+mJjkvyzXw
	3MtyRx5N8kaHajiIvwwOev7k5hmADf9LvFuvGgFiIQ8OKxVR5wik05DMJXMn0dKLfRLarpODwYC
	Jp1WsBP+7UfSX6/8WWYupCcUI7sHjm0M9H6XZ/1qnH+wdp80smlExWzUEJyv8SIxFs7ikA=
X-Received: by 2002:a17:90a:c888:b0:34c:718c:5448 with SMTP id
 98e67ed59e1d1-354299f4a62mr4806616a91.4.1769759158099; Thu, 29 Jan 2026
 23:45:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130055508.3462700-1-shengjiu.wang@nxp.com>
 <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com> <CAA+D8AMkipi_iX=vagZMHXTNtqUqyFeVkU1Vr_wb4R82F1OHDA@mail.gmail.com>
 <5c559d32-c75d-469e-8652-86122cf436df@nxp.com>
In-Reply-To: <5c559d32-c75d-469e-8652-86122cf436df@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 15:45:45 +0800
X-Gm-Features: AZwV_QhX1h_sXu2udLuSrjmEyu3PiDv_14Kt3Gf0zaIQ_xpv8bfSI3HflORbIrk
Message-ID: <CAA+D8AMoEaY0WzU82L_JnwhHMeA4THZe0bgBSgsyuvhjP9Z3AQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 3:08=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
>
>
> On Fri, Jan 30, 2026 at 03:06:19PM +0800, Shengjiu Wang wrote:
> > On Fri, Jan 30, 2026 at 2:49=E2=80=AFPM Liu Ying <victor.liu@nxp.com> w=
rote:
> >>
> >> Hi Shengjiu,
> >>
> >> On Fri, Jan 30, 2026 at 01:55:08PM +0800, Shengjiu Wang wrote:
> >>> There is an audio channel shift issue with multi channel case, first =
run
> >>> the channel order is correct, but second run the channel order is shi=
fted.
>
> [...]
>
> >> Can the channel order shift issue be fully fixed instead of implementi=
ng
> >> a "recovery method"?  I presume that this patch implements a recovery
> >> mechanism.  If it can't, any chip ERRATA?
> >
> > Yes, it can be fully fixed by this patch. I will remove the "recovery" =
for
> > confusion.
>
> Then, you need to add a Fixes tag.

yes.

best regards
Shengjiu Wang

>
> --
> Regards,
> Liu Ying
