Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B474347F2FD
	for <imx@lists.linux.dev>; Wed,  6 May 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077471; cv=pass; b=gAfbYKX1uEzXkpWk6OfJdrBwzmdyNIUxBBafVH9G1n3p4EgABvibbsRR+EvPzPhg9G20DFxRvlxkzm09uPOk/nIw2//oSFXAcFn1xD6p/zpl8f6nO1kaZ38LBv1f/ywC4+dfAlnl/F5uySsPA2RcoJ0XYwZ1Jum4dSz4Y33zPIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077471; c=relaxed/simple;
	bh=5RGPGtjg6gfxQd5la71FcBlakZT2mGW9DnwBFYIWLZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDQdLvrLHZV/A6eOkZFkYZhFr+WQe0sS4mDZCxqiJKdJ8yM+OhSwdsP4ZocF6qFtb/DhLyqHs0cNzC/pUqQnSO6f+ORWZ/WMi53Q/3UlnP+2e3I1tXTTEoa+JUCKenZffYApOkDQymtVhd1/N9NeSXVQe8KvmpVBOSThZKavrfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXBHcBgV; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXBHcBgV"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-651c366f7efso6316808d50.1
        for <imx@lists.linux.dev>; Wed, 06 May 2026 07:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778077469; cv=none;
        d=google.com; s=arc-20240605;
        b=DQgs+uzqv7IfUOOj8IarJeb4hLTJ60SOS4zzd6aV1pdk8B/5LSv/3EywdZgEsHVvZ/
         e2bv6ClKPrJNFnkX2tZO1MtIQxOiyOx5Rcze2pk6uvzdw5O0raVDlaC5rL5wAXQyZCB7
         CjL1HtNBCOf6Hphkip8LWjmHuythrSjR6u2vcHSgHyJvi3GFO1kzm52ITHiRq9PRZkqT
         GoIsJ1hvbBmGkKFHR/H34pD8Nf7SIEsDU+SpmDEHL9ycVhHXGNBYDu+ZI1koq2HW/Lbh
         V6Q2M+adtuAc7SlKGqioG4JRcR9ouDHlqruZwjprgxNaZp2+xelUs04B0QgGMGvw3puj
         UyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5RGPGtjg6gfxQd5la71FcBlakZT2mGW9DnwBFYIWLZk=;
        fh=J71YAfv7dU7QRc20jScogGpfI44brpeC4NlwjUd5PoE=;
        b=NpdfDKHniHObEiMxy47sOGcxfGZQywVHd7Cu8aAtV6xcL01JquJ5LlU3z/fj6ft37O
         pWwSrZ38Ih56TgCeofLIHCpt8CpIVOlPJB9zO8zePJKUTcEW945H2jvdYRq0c7FhANFd
         yaJG+1imQIWHrTurW3Y/I7+xQ3lxBi/drKSJWIgKeeLL13nWLwjrbI4tdBsZJ7iqRJHY
         Lss86i25ZhnWrVdrow/MXb0J300+GCPz1BJslbnoe4GMM8Vnq52FW2F/IB2C3rSFrr1l
         Op+A8UaybIQbVF6KBxpUOe3vmCORGM6j2ah9NDmF98p+MviVrQWqijlNvu1x7190oQsQ
         KMfQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778077469; x=1778682269; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5RGPGtjg6gfxQd5la71FcBlakZT2mGW9DnwBFYIWLZk=;
        b=jXBHcBgV9G52q03SFHXti7oJSlMLU29FfTkW9uGaaDvzmMlB1hTxAruL1S8BWnvxU1
         CGaBXQHQkDigA5HGOew8TXslQIfjCzF2eGkP0B45+hjfdHyf1u4Msi1wcKGOcrzikMqw
         GvXBHDLgAq5OUWJPNe6w0M7TJzf9R8iArSiIfw+RHA4js9xiettWs4iKDNQEanL576Lp
         WrbTRz0M8t1bhYT4jIAWUxycNt7YO9eg8UEEkC45Fo2DOUxFQU1KYx2mftFD2TYTemnP
         e4ndGzwJU5aTQbqb8Zx7iSuq1OW3XVc2pon7mq1HgrQpktammp8AtdLa1/kZ9UoYUo1U
         Z4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077469; x=1778682269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RGPGtjg6gfxQd5la71FcBlakZT2mGW9DnwBFYIWLZk=;
        b=RHVGO/F3YmziDabXdsTYgjNPZ2kvcLT1fyG4NXaMZlAeDLo9pST+uMZMdFtwh5AQP7
         Og4T/D1ubmPVe4Fy0V8tn/u1yKkKxhGn21JQjslY1gd6hFJsrcoGxWTxIzpRSPlWFAab
         VVnum+nC6h78TQU88BO4oSx0fxLbfTrzpHY9mOcVDSZg2+OzNLotQKZkVBwWxTvtRMeC
         oaIy82tyGKGjAYuhEYWCpd1/ZKU4t8PBsR9IcLD4Gp5fVVrISYYqB56FJcpEJ4sC9+Pe
         VVqPN+tgaF+KpUczxKmgRpZLk1JwVOR6Do1/mMJX8Cje25CmRaDXCM5QYw4CHlhNN+pF
         FyBw==
X-Forwarded-Encrypted: i=1; AFNElJ81TQJuYbkGlTYNTwUTkh/8IfL6mlC+wfTEgI+5MWl2xEBktwjVHNdlTKuUvQvB5c2xtN8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxD0e1/wLS23siwP7agVze0mLElsVq/hyJugl/gydM9TrJMxX5a
	VyQVIhDLgsn7YhgJExpPDriuCPHrL9MU8cAYfSdwBSYW1AYrk/1inF5ZCEkJCB16SnNgbIwHUMl
	bEDBxJu0woLTGhz3Q1nL9SHInCZBbdNM=
X-Gm-Gg: AeBDievMYtf7XToNDYsaxFURC1zTxeUnqed7A9esMpHOyf6zi2sOWZjnvFVf8JKtUgf
	FGDT83a+hYN68AztWApDEMW26cbsd2sY5tJnGrBVlqy3jW21kS3YUae3Hw4GTWS+IOQ8xcaWQq2
	uro9NUGEvFNP7dwgub4Lsw2L3tw0PJTg4j2O4C5MelFWyYYkpWzN8Zokj7B9NJhrAwXcJl/QMb8
	JQ7GEvi38AXOgipmQpdvpYXgwESlTgFPPFJHddrd5kOnce8O+/QrAKHgKx10IG19pLji6CnOPji
	F5MEwejLgZFMN/TNa2Y=
X-Received: by 2002:a05:690e:4844:b0:650:6cb:a720 with SMTP id
 956f58d0204a3-65c7999803bmr2796421d50.39.1778077468595; Wed, 06 May 2026
 07:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260506092324.635014-1-lgs201920130244@gmail.com>
 <afsO9TxVuz79FFQ0@raspi> <CANUHTR8PNO-3hfEMCz4Zz_2ERLonE7OyNzPWtAaDtVpNB=YGhw@mail.gmail.com>
In-Reply-To: <CANUHTR8PNO-3hfEMCz4Zz_2ERLonE7OyNzPWtAaDtVpNB=YGhw@mail.gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 6 May 2026 22:24:17 +0800
X-Gm-Features: AVHnY4KKgBYwbo8b0KFKRUex7D8jzHNmM2otoNT3MCUewJRlzLyKPSEF6hD8vf0
Message-ID: <CANUHTR_201tMArsXEjuPKW=drk5hfyfneG-sJDqScfxNLLM=Rg@mail.gmail.com>
Subject: Re: [PATCH v5] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
 device_node cleanup
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Liu,

On Wed, 6 May 2026 at 21:58, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> I will also drop the unnecessary local NULL initialization for ep,
> since the helper initializes the output argument to NULL.
>
> I will send a v6.
>
> Best regards,
> Guangshuo

One correction to my previous reply: I will keep the local ep variable
in imx8qxp_pxl2dpi_find_next_bridge() initialized to NULL, since
checkpatch requires pointers with the __free attribute to be
initialized.

Best regards,
Guangshuo
