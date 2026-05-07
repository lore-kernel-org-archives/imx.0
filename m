Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFC23BFE34
	for <imx@lists.linux.dev>; Thu,  7 May 2026 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146872; cv=pass; b=KQkb2nkbEQOmqOx5nUjXZVGLt71oxIpm5nR3x09SRwbYo4JVOEDNpADZkavXr39wfOcezQFrw4NxEa5/0qCqSHlZp833Vk89BaxiPLTU7e0KHactGjF9wpaIs4F+aHc/T4c5v03KLGAZccfjfYMPkyUhpY3TB/HHc3DBXSZkxz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146872; c=relaxed/simple;
	bh=hCxd+5uv4hdNBXidMCSMq1z3BpfTFZGcppb4STtJd00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMuGA6aQc5jfw9YhwF/ADi7PPYTA2HlDpEFQsUz0YVA4AX0lpFA/sgPO95Kag9MnyH+bc89ex2R8jwlGF9xg4qdIR7fZE7PEVjE6zXrTncLpN2zPYiIuFcpo5ZMi5eojF7vny7EanyJXxyp/O2Mk0RIEsYaRGBJpqXUHH5PAxvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcgyW5tw; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcgyW5tw"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65c21049dafso612156d50.2
        for <imx@lists.linux.dev>; Thu, 07 May 2026 02:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778146870; cv=none;
        d=google.com; s=arc-20240605;
        b=HOK452/OvPY5lWECJuQEUbWmlQmcxq7HfmlQ9nC32FXdCEmL0LVqWSDUUlWykdiwPK
         eFx4q2y1HyvsulH2G/PsGVOho4GsFKZ7Fzp/2xv4oWZgbz6rvVTCjHAYsESVctDOC77U
         OlzVy4Hphp0/7eOpCjQIemAwPTfyvN6z/X5dx7bGDGSf0WVQy4YT3h+MfT/oYPZKAOey
         XD8hrwtTOlR5erVrMsmd3Mz6nDiejyXl5hJF81K1rNoQX/7vxSodA8HmZQk7nWW1p2T9
         Z+kM1s+7bQiMlnv9Nn0wJfGIgT8vctFtRrW6VXK88MtrPOg8DN52m57wb/Quqn4v/xlE
         ZQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hCxd+5uv4hdNBXidMCSMq1z3BpfTFZGcppb4STtJd00=;
        fh=S0o8hBXysBKV7UG/nsg8uhJt8t6V+eSzMsNJ5RLfv8I=;
        b=Valo4y1bH/hb2G5WvpP8zqsIagFzvBzMb1EU8D5GR6gZa7M2iStx6JfLgNmD7CWFcH
         MXffAJfStdWONcZWuSk58mk38CXxRFu2sPzNNG63YCHILW/BZHfj34iPKxju7GRGtdDf
         vLLT8lcPgxAwMT0QNMtTPqRPsXKYU3lE6/lLNGwA9q7LI2iAvpm+4fw6QeGfalnzWbHA
         J3++kaWOJ91CGyRLCNw4vrBLBbGkUjltKxKTNvvAf4WXWOYtJLI+OqzLSx3vc4EfYXpE
         16uaLi8Pwh/VJa5P40FNNezxZM2EM1gP/QOmD9p0JeBJMiVChPi6YJScuoV4OYmu5CCO
         fHow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778146870; x=1778751670; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hCxd+5uv4hdNBXidMCSMq1z3BpfTFZGcppb4STtJd00=;
        b=DcgyW5twOEjqP0ctvF0YKGs9pBGgWHwkUseCxHP2UmCnTfuk3RXJicg8d+RDTae/KS
         8fbOWy8gZEk1n2Peym1gPd2VSoLM9EyEzu83ynxN/sSDpZDhIHfQJmnPZ6ZpF3LnlKsk
         fPecDAu7tVyoF0REYlf7qwc37dM9heuyGm18rHLCv0fBBsOpX5pc/DcPDBqoPvMu0FFq
         qvuolfU811Lei86ivwikEvkGHq8uV+ns0bgQlqAkzmylERrziTSr/ESw4e4CT0JGV/3m
         fGOOIaopVNyKN9jEBxUyxhRUAYWjGZ/1SksdDm8l59tIHW/Zm5+7YaxyP4XgSh+vt6h0
         D9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146870; x=1778751670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCxd+5uv4hdNBXidMCSMq1z3BpfTFZGcppb4STtJd00=;
        b=NRqNIi2ey2mKWK4NjI+deY2beYHCMB0ezQJkHb6m+m/Y42d5Cz2avEsZntTCOPJ0cH
         W3JcRlv2H1Zq4fCMgIjEMHwD+glAtKxg+kEI1LNV3iuJ30gRmEyN7+DC1MXlbTBiPOXL
         YDemMa3QpL+1VWeWyUHNfcdEeYCRjx4ObP/VW/G2/KH5NtD1odNpS2MkotxTL3wP05GZ
         pf4kbmBzjpvZq82R7NZKRKE//m8+tMBaX47H5WG7ilPeubDBA1+HcLVMmoIbXItdfQ+K
         XXgcNvypcyaxfpKZnC2h03xWCM3xBbUS95WiTPDJ4gGcNjB6v7PAK9GImEwvOEr0CsYt
         1dQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iUtVzFcRvbjdGsQiSI4W9QibN5o71SOeeyFspmf4glm6lHeU6yd/7k4GPcq836rRTGzU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwATx1cXrLsenABkooQaWNoO1cvqr/xm8wWCEVX7czFUBXz1LjF
	9ZG/xfItBnaEQ7YD/vcO9o83yRZiQnT0ZtS/XdC/PZfYE+Ic1e3bT350WBXpYSYnTPK6G/tVkpX
	xU4FZMMqWOfg1xKqjUbXeJuZQCA0vaec=
X-Gm-Gg: AeBDieu8iEsuhRdxhZUWjlc687MO8rDwmRHPNXnMuMCmuKRwqq0wnjhbLSy3oQaAVUx
	7hXrJ9BQSoizbSyA6EdR14TXWcS12t3+qnYWJYGnxbZiXhzftp4uZsGJfE7+/UcDo02U7p8PC7D
	5wvRaTDclHd/ONpcBZqut8JSo6PFo/yi/7M528IPf9Ebcr6FkLQPADRDWZd2crtErInasCQEc5o
	VOKLwnYrrTytkdqFM5xZUr/agqAi9/zkqQuqRs9QMWglcx5uAgc6XY1XtbFps85IX2wnhYlsjGA
	CeBwtcQfLz9yKC56poA=
X-Received: by 2002:a05:690e:1516:b0:65d:796d:8f00 with SMTP id
 956f58d0204a3-65d796d9d08mr2772997d50.41.1778146870374; Thu, 07 May 2026
 02:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260506142434.643523-1-lgs201920130244@gmail.com> <afv21xfKE9PxGWuD@raspi>
In-Reply-To: <afv21xfKE9PxGWuD@raspi>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 7 May 2026 17:40:59 +0800
X-Gm-Features: AVHnY4KYf5mnb43sXj58-NXgedFQvaoKgE77KqA04IMyO14JzMOPYqCJb3R-yfY
Message-ID: <CANUHTR8BS9fo0a6s=+M6bfgCgcWtrpepg3ayv3F2bkDoWkYmDg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
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

Thanks for the review.

On Thu, 7 May 2026 at 10:18, Liu Ying <victor.liu@nxp.com> wrote:
>
> On Wed, May 06, 2026 at 10:24:34PM +0800, Guangshuo Li wrote:
>
> [...]
>
> > Initialize the output
> > argument to NULL so callers using cleanup variables hold either NULL or
> > a valid device_node pointer on error paths.
>
> I'd rephrase:
> Initialize the output argument to NULL so callers hold either NULL on
> error paths or a valid device_node pointer on successful path.
>
> >
> > Keep explicit of_node_put() usage in the helper and in
> > imx8qxp_pxl2dpi_set_pixel_link_sel() so the fix avoids adding more
> > cleanup action usage there.
>
> This sentence is not necessary, so I prefer to dropping it.
>
> With these fixed:
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Thanks!
>
> --
> Regards,
> Liu Ying

I will rephrase that sentence as suggested and drop the unnecessary
sentence in v7.

Best regards,
Guangshuo
