Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F0C15E8B
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730107253; cv=none; b=YwIH1Qa/RRVCLScjwrKzL2Rw5vp6I44u1kh40t2J9iFGqq/s8+b10TrTGFBI7HPsE2RqspO6yXYX7MRiG/hXHnC8jtKIdJvfDGDeiidobnQbfHNJO+pLBm/0CNUhNuuZ2f3N7wrQAgEqBqHD9T6tlJYvxfLPiZYiV1OgjwdfdF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730107253; c=relaxed/simple;
	bh=j9Yh3zrZUalX47mvMkgSXxAy2RuDtztZjtjGaLcmm+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bL+QJTS7aRn/4xmHAesC5S/pLVmXLiamg7+xg6Cn/sOC1tLWUOJOlgjYgOoY5ncsLYNv08GNc5qo+l/+mNXVcCC5MNw0KM9sgiAP5Hvms3Eb8qTPfd36bsQFKo/eo4fu8QAu3aRcTtIxxsQrxr2msoAQhTEO96VK1ELEPKOaApY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZmT2dZ3X; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZmT2dZ3X"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so33548271fa.2
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730107249; x=1730712049; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VPBuezFB3CXtTW5/lJNTKguPGRqG+lEFtQVwqgqjd4Q=;
        b=ZmT2dZ3X1VFE5Ilk747DHqTvFcwUl7q2ObAJI7Q1nsE3SigUaoutm9Q+K8oZdnV8Iw
         KFPvAh0BMVTm9J/gC8/BcFuNvnOFRO1/xKmi8vLfaBB6979zVFXrycyR5T4morGVgFjN
         x+YFwVb349VLUvsWhV/qfDIi8cSHfsF7+f/eVXDLIpxmvZoZ2cLUWvwQtLbSaZ4K8AA3
         IGlKl3n6uy1u4Nyw/NBIV5rGNo/qcsz3TNrvATrO/nEIsbcJ75TyeaGj0FCHGjQ84qR3
         wd2j0N9Nsv0jnl8Ksqk3UFEb84CbOFyPEDSIKJ3sNXMjhvoiCBTL5hT+cfF0QSMa59Ba
         uS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107249; x=1730712049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPBuezFB3CXtTW5/lJNTKguPGRqG+lEFtQVwqgqjd4Q=;
        b=TprEawJkppxqQ59JW2dGCSz5q1eZMLpidoAzmLSGWAVmlrUBdskJVdEw603ohVn57T
         fTRtNq1XHrMQmFCvbvjC2VpbfW9F49veNu2du4c/L1Hd3E4tbiTUMPA8mi27NjTclDmk
         lPaFcxCDU1pB5T/EglPfv5UFCrm0N10/nUxnUhNgzGTuAm8Zf9FTCwX2zBJRBwox4i7s
         bikVUrqdQlNxH9E/+QVfalq+0O4yrrE7K8tFuP6sCRTGwBOSfnYeSDvDij9gFJdeE1KA
         d7Myu0++tSsJqFhgEd7IXZxhIGELHnE8FPswsHr5CHGzUk6nZZYy9KvQfbeaBPa8Y1Cn
         eyKg==
X-Forwarded-Encrypted: i=1; AJvYcCWSa3bQZLPJk0soEchoIT8S0CSKIj2dp1I1D/dg4aYMwQ0w7Z7VAWnquJscG86UyqwN1JE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp/b3Pt6yTbTr/E+jMh3v4Fc9cvfiJuRszF/vgqcSktqY1WIyx
	u9e7zRsL+nB0H3CT4MyadLU/txOe7n3ZmV3RadbnEm9Tul5PrXIE+YQ1yGyMg6M=
X-Google-Smtp-Source: AGHT+IHMzC2RrBK1gDyjb7BDtN9UQMSMyOUaimH3SDT8yHY0Jieo0+u5sTv3iUOAiXJhLKZA5AAPKQ==
X-Received: by 2002:a2e:bea0:0:b0:2fb:5014:c941 with SMTP id 38308e7fff4ca-2fcbdf71340mr25188781fa.14.1730107249435;
        Mon, 28 Oct 2024 02:20:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4507c44sm11199391fa.19.2024.10.28.02.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:20:47 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:20:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 10/13] drm/bridge: Add ITE IT6263 LVDS to HDMI
 converter
Message-ID: <tjtbvn5ewlzs6wqkp2ffquiiebakhv2eg3vt4mzooeb6nibx4u@qhwx4hxvj6ou>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-11-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-11-victor.liu@nxp.com>

On Mon, Oct 28, 2024 at 10:37:37AM +0800, Liu Ying wrote:
> Add basic HDMI video output support. Currently, only RGB888 output
> pixel format is supported.  At the LVDS input side, the driver
> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> mapping.
> 
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
