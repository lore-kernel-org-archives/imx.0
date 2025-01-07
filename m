Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE331EF088
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254839; cv=none; b=pTEfsezrsaoZs4wj+XQWJl1OqpfOV+DCUgnb0RBK0LBWsuZ8FGw41zjpdmEBEhLAI9e8SFAW3nBtFmr9aX1yOLWFJknY0FsmrasvOcyuBQE351RZsOwh78qOUUVR9LttpHGCBWs3NfzMgrtGQevFLiVsjEU9wvQYJ4dDQ0GML3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254839; c=relaxed/simple;
	bh=O6QMkNk/DURY2My4ysBdf6Xr2szSslwroXk0zfLQO1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KFcEG1Hc6umunYF+L4ic5+Lm0Nfz/fU9hWOz5G34sHRNbTcZpw8kIJUQmLP7x6jow2JbLuzf0j6DzwgS+dtfD+VCYrwsQkjMEwPRJay6GzTF+z0eLwF3yxqBZlSdVjsuMonG9G4zfEXu+zerfUR7NXUj0N3AY855C2WbdxQ+Gfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SKncRO/Z; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SKncRO/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736254832;
	bh=O6QMkNk/DURY2My4ysBdf6Xr2szSslwroXk0zfLQO1Y=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=SKncRO/ZdFOv/G/SE/F4YqbOUMlXP/z1eKx3cYKNcYVtoSft+WqEjl68wm6C7Bz6C
	 QDvPhVM9GZtX9HVXEGShNYHIvsVYK7FS3qO0xgbT2JJbE3Lhk7nGYCNGRfGt0Rrvvd
	 fJK1P/DLpOVGYZsm8kd54wZncmvfhliMiVa1838Xv0DKcoM8r3GOWaBNOyBdp4PXJx
	 KJXnKY0df8YtlWLZFYZqcmywtfZ29Ohs1vec+Sj6/WLCiWtung0+jUQAEU1xv7PwQz
	 n6Zyt6zNoHgLdNTSWLW7NfUfYI478tPjeSDtJUFKYuLmZ4+SBZnq3Sd0iMLPPWe3Fe
	 USGrQp/BYMXDA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 20BBF17E1574;
	Tue,  7 Jan 2025 14:00:30 +0100 (CET)
Message-ID: <fed8126b-cad6-4f93-827b-980b9d6f9a69@collabora.com>
Date: Tue, 7 Jan 2025 14:00:29 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 07/01/25 13:58, Krzysztof Kozlowski ha scritto:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For MediaTek

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


