Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F39015852B
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622535; cv=none; b=Vip827+1xl1Z1QHNB/SoVtMAqum2+4EP+5YCfpEakeyKCaVIGGZGaDca0zrAJnFypGxMFwgoZSQnoXAzlgKKr1iwoIFWhhA2SHKDrrCU3k+xvmC22iqxZ7uIuN5hXRhmh1QzPio19C1GY5JwWV1ZGA08krNlfCmgK1fNByF47Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622535; c=relaxed/simple;
	bh=XF2QmJ5s7PXjzUAPDJ5DuMHsT4jZHu5RgH0eb39TqRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVPLqcTkdaHsmcIm5PrvhZilsoLKO6YrWqL7Dw0NZimQgQ0ghkwgOG84jFZRny4vCacfThHFgGq0L+O5LtxkAQgO+fM0DD/NFDdUkiNpK7QwLu8GE5mlF02MfbHSsirwir8MNUc/xA2vKK8m/uz/Op7D4YX1O5KSVv6ge1q+NPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZcZ6kJKp; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZcZ6kJKp"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso2060407276.0
        for <imx@lists.linux.dev>; Fri, 06 Sep 2024 04:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725622532; x=1726227332; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G4MGtjs5dofMDa08crIubVUGiyT33xxJyNXECaSO5qU=;
        b=ZcZ6kJKpEOI9ZZh4eIyqohz6flarzSqS2dzAVUKelqlhLbyBUZCoxXOb7ego1g1vgF
         I2Bz4ZT4GwbNxYa6o2unEWTEx54ve9E3UuJSkA/MUzKGDG3aapguuf60KXI6f2648xqh
         lR6z2bPEKr2WaCc2YjDC1BD5b3ZrgYmT6wvWaCeKMk/9keSUoQglPieH0vfQnf4rhoBH
         mTYvehhrFVDaVLFoDXXuNY7enaZL/05nLeECMnJbyMBUNP6ra0PGPtpk6b9+2w4hTQ21
         LELz48124sVUn/5yCvqeoviYYsCqhrfnkAaof74oUJiPXpYSuNo7i+XRGDYHSu4bDBHE
         Z6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725622532; x=1726227332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4MGtjs5dofMDa08crIubVUGiyT33xxJyNXECaSO5qU=;
        b=lCSymg6xitojPv04SAoAHi7UYuwmgUM1mx7hRsum06YuCyGfJjuekP8joLJoJh6QpZ
         CLXqC3TfSV+rmz2TPxSB9eHCZ/TQvxVpnTU0TSkzvvbOYmejGecpxUtJXItmScRrt94A
         ETBSgD3Ov7N2VOy1VmmbM7Cv/XwTJce9E6ifS9wbxIPtklSfexN9wzpiRfh4iI/xX14h
         jtgVM8lMU5Ffo/CPUvCZaQOau2FhuWGAjVPTCbYn+vqWYcKMblQPi7hRyvmIFFJ7gRmh
         2ATTAn+xXc5rMAtdc5DlxfbwHx9xTCh00W/U/bP5I547HRtZjlVN3hy4/tkWB4PZ6+sq
         EbSw==
X-Forwarded-Encrypted: i=1; AJvYcCW/GlBBBaUlnCYAy8XTRmTrgnSPOcj4fipQb5QlgUt2qohiP+eB8ETqUVnDnBlESGIhX7Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGKKoW/5dqHjfw0cxFc2rMV1u1lrgpTSIt9Ysx2LtUCKEkDvsT
	+1wyZPrsI3y1vsrrcz8+IlV1v255ynn5yQUINgAA1o4w0reVm8+vCfbSKPRBiyxqhkcqkVuor8N
	bsGmWRKIaA3I0yhZbwQJSZQ5ZKFhyMBEyQlKMDQ==
X-Google-Smtp-Source: AGHT+IG+ElisUJ0/Qq7f/WCMCZfQCBvKZ4j5xc1ADihAYSJbTXA18QR6nGPwP+SLc7FS1BLGz6TzDS6rI43soiiWSOM=
X-Received: by 2002:a05:690c:6f03:b0:6ae:528f:be36 with SMTP id
 00721157ae682-6db44dbab24mr29072817b3.12.1725622532290; Fri, 06 Sep 2024
 04:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Sep 2024 14:35:21 +0300
Message-ID: <CAA8EJpoz7jtjN-Dxq-6SHNiZCz2xsFFf5j4HOoFiLAq=OnHn6Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Sept 2024 at 09:39, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> When drm/bridge-connector was moved to DRM_DISPLAY_HELPER not all
> users were updated. Add missing Kconfig selections.
>
> Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'll update it to drm-misc-next if nobody objects within a few hours


-- 
With best wishes
Dmitry
