Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB3A21256C
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 05:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760678325; cv=none; b=BW0B3eBB51Sm8iBld+SqXWMq1fXp0CS0H7+AiGl33ykjn4ih+tpxZzVZX9G2wy2bw4cRtmehB1D8g+sZozLjJWtCKj++rEM0MQGl3wES64YXuzjIPeNTG8M6271VQLdsXWGX8vu7vFvUPei9mRCai04XKUsFVjefbQyKVNPVH5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760678325; c=relaxed/simple;
	bh=qG5HMa66bXcs8gT8hnOihrhSdB9Nf9qJM+cXeN/bESE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBn2axnA6Jisvi7tuQD70j/nhX1hC6L/dilFS68pnullnb2Q6qEWX6Q7n01MYFgT57SEQhmZslrVLu6rutnqkWKTbuRHNjK6k9jDrcnWob2YhWBi4X/W2O4CaAfhbJmsunsEzfOq6wwg4TrJSkZNHsA50/cgKk+kOSOB5XFjQFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gmw9KLpW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gmw9KLpW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f67ba775aso2177311b3a.3
        for <imx@lists.linux.dev>; Thu, 16 Oct 2025 22:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760678323; x=1761283123; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l6S63uReOFquePjk+el+IDhyWrHQTPL8Zy49l1W17no=;
        b=Gmw9KLpWsjzPPmt9Ya0cgJ6caKFxcS6GEqib1/9x2FtgSNf5pXxQQdcM85HDLxtEy5
         0dkn87yXbt1Diav9hIbVGvuFgCCoufqFL6/W/FyTJP4u1OJ9dP1/iMhONH66JIjf3HP5
         FovXHUcbb8SjuRr2IIAdY150uT13dk2Zral/edD3cdZw+nNq6mcEppZv8cz4nl/cTuEx
         +MXZ04rLC6Brraj4tn3N9JKW1Nj8z9qFVQ38PtDXZMrH0LgWgpog+KFEFqTiTZ0QqzMK
         xe2H8+IUkrYluJywBl9XCjOcViOvxMr091LUBK8nvXPBagXhh8Pv+RFLzi3LelYr3/Qa
         qleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760678323; x=1761283123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6S63uReOFquePjk+el+IDhyWrHQTPL8Zy49l1W17no=;
        b=tYk4qAgGkIHOPmf+ngzWYjZOmQEfgAs9QfCNzLjHUB/F7JJKSyQKM7n+N8dWoBrARw
         gADDXV2P+oXtHrXd+jntvhcxuoseADLFDzPJi9pkbhYqwhsnkchUMaDSNRiu9gAE6gqr
         TFhDULw3byL9kvo+ekOyHUelduaxGH4uRIIzZN6kMkzvfn0WFmJp8l6feO0ja217r6AC
         CQqLV+Nql5fHVMowVEH1ShoqMDkHrY+mRrmr4cIQCh1cwRYp0s1EGkhDU5k3MsSKk3kR
         fz1yfL6IwnSd5/KZx7K41oEkVAlzGY8/taiaX0WKp22Lxpc186ipRyQYApFCGDZXyzW6
         qYoA==
X-Forwarded-Encrypted: i=1; AJvYcCWTzs3vy46V8ZBZRt92HiXZZFaJgVTuXJRR4ETN/KnXFk9Gj3oruqQL0ROHhQewh03AEIw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAnwhoxXiPSBatazBumMHwrewxb2VG+2PHCPjL5EjwJVnlWDWC
	Iug9Mon7jr86P4EYviLdHRTZRJRf3BzEilP27qgR3sZwz2ljx6n7gDz0
X-Gm-Gg: ASbGnctQ5EETQGYXOhtEJQ0Ez/9hwMrRwZz2/xVT3Nvl/ETuEWDMR0zLk8DXIQOLnUs
	WJEXXGjjsh4CQlPAxIU/Va0pFFwnEMJJu7rJE6sUEvwL+GN7SVFpFpyOwcJGGNqjJPKg7OpwU2S
	G9YFSFBuww+rdktZoczdmRnRE79PyB1bzEzYABFySZ409hhVjPYOzF1zGYs+BWgcBGUXy8pCOW3
	oTz2moZwaCsof+WCesz3vlOZh/K9fReIFV75X0U9bWUEHlD9IhhcDB4+Du1Ms6up2E8JQGMvxus
	Xk0oA5tOM1V4SOWB/9OPOYAmcxHMtQcvhLa+0N04LtwZF5PvWJg81Ftjf0+yeanG3Utnt+ttgra
	RMMgRL3eY820surnfvj57AuoGKbkTYvT1EJ7lMEFhHWmvpAcTaVrrvoyJj6pB/7PVfQJs10K6e4
	27v6tGnAQwXPsZAatdqvq6+y6hb7Uxbfk4uamvODHEQeuRqkPef/Y=
X-Google-Smtp-Source: AGHT+IEoZYavaM7njBnG3D3Z+hduFKNotyz+5aU6kPX8BleR1uI1Sy5GSDkuztm0nYl05g784spRlg==
X-Received: by 2002:a05:6a20:9185:b0:32d:b946:dd20 with SMTP id adf61e73a8af0-334a8566437mr3249260637.24.1760678322944;
        Thu, 16 Oct 2025 22:18:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:df8a:9eba:d1a8:6b39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d993853sm24177361b3a.74.2025.10.16.22.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 22:18:42 -0700 (PDT)
Date: Thu, 16 Oct 2025 22:18:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Julien Massot <julien.massot@collabora.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Martin Kepplinger <martink@posteo.de>, 
	Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
Message-ID: <xirb6664gow5ldjy7xihkz2wooidbm4bsyl7qrm2uosdybdki7@mqkdqzeznx6h>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>

On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR()
> 
> This patch fixes this cocci report:
> ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Applied, thank you.

-- 
Dmitry
