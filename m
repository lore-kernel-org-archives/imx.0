Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E682D781;
	Mon, 11 Mar 2024 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710178941; cv=none; b=A2qFA6gXUXSZgF4P5g7CGqApcpJsBEl4f9OcYTOW+hbVH3tXpDp/8w30c2WbYt1Vke7fBe+pWReSdI+FhS/oDEI7i1KloUGC1BJWN5SysVsjrkpsSX5KVPyECXdtYkpfjkicA3rxIn4B+EZ5qAVnJLWIZ84cfhLIYczBGKsNF4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710178941; c=relaxed/simple;
	bh=eIK8ck9qFgdzPH9Ge4megCULbdYgFdE0in7FXrXDZ4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejBIWaQK7LE1PogRQ48zTNkjVGFC0Sz8qjJGHopalQi7q8uTb4CAGNPwJQVP0v956H554N+xnGaO8i8iujp3RzLpilBK4mEMcwGr5ZfNKl/9zmaxADMoya46RH0jp/aiX2jvcc3wpfvrvQx8zGeHwvTW+1LUjzgjgyFvXMuXWAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxQ0BRB8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxQ0BRB8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD3FC433F1;
	Mon, 11 Mar 2024 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710178940;
	bh=eIK8ck9qFgdzPH9Ge4megCULbdYgFdE0in7FXrXDZ4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxQ0BRB8qm4W0m40o5dWtGMpdtsnKbtg/jXgr8jiUwhuszJtVQwVa0ZHmNmORhMRC
	 H72/3E5ijoVpLvgVNXJNhD7L0O8khV+I52/K8/QzQqbRWyBO13/PAGpM24AYMwcpky
	 aLvMWd865rM9N5O4B19snk/Xz4qwJ8r9KGuLUCNXdfGMcye8XSAsRndSD5Dq9YoWrI
	 qhh5XbOUm3u8/l3gPUXB3WKXqYphZa7Fg3P/Bn9kcNeB6RIZws3B6li0aBv+J6rEA3
	 avqBQnGL17sO8xhvBWy9U6IAJWbUuURQBuhePeAUPciDi/k4CtddQ5WKd8QqGan19E
	 dMJCLP5a+iT6A==
Date: Mon, 11 Mar 2024 11:42:17 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Chris Healy <cphealy@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 01/12] dt-bindings: display: fsl-imx-drm: drop edid
 property support
Message-ID: <171017893732.1474464.15771358917061546141.robh@kernel.org>
References: <20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org>
 <20240311-drm-imx-cleanup-v1-1-e104f05caa51@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311-drm-imx-cleanup-v1-1-e104f05caa51@linaro.org>


On Mon, 11 Mar 2024 13:20:09 +0200, Dmitry Baryshkov wrote:
> None of the in-kernel DT files ever used edid override with the
> fsl-imx-drm driver. In case the EDID needs to be specified manually, DRM
> core allows one to either override it via the debugfs or to load it via
> request_firmware by using DRM_LOAD_EDID_FIRMWARE. In all other cases
> EDID and/or modes are to be provided as a part of the panel driver.
> 
> Drop the edid property from the fsl-imx-drm bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

