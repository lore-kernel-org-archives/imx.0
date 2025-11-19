Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633B32EC56F;
	Wed, 19 Nov 2025 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537641; cv=none; b=KymTCL0AzoUl/sRGsPYYPd3hkvQpOqWAlLxH4Cj2xS4f0hoZXvRc3WYDnFGDltgQoJO1zJpwagTV8kYk2wSLgBczFzH5FNVuibi/TKVE75wsTKvSiOVovJyMUpEliyjiKgD1Mb1NJIpSlxHcITGoO6t693Gsh5DzdK0Gd5XTN2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537641; c=relaxed/simple;
	bh=+VT0vHKyeNB2uauVAiq1vH/zwODt8yBbpa/doxp/yT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNAiS/UoDHpWPSznh3/0rAh4DNfwC9N1ctDWZUmtGuPLZHlAK0eA83C/Ob9LsEXQ8VXo1wHGsuz0J92SGYEsvi5MUiLSKCQsV/9SbgzI2q+IezHpRX5HovJwsLlAGINcktrX4syEgQfJp6sH7G0pFMvzA0kd1+I+12xEifv8IQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSXbdbLC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSXbdbLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F574C16AAE;
	Wed, 19 Nov 2025 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763537640;
	bh=+VT0vHKyeNB2uauVAiq1vH/zwODt8yBbpa/doxp/yT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MSXbdbLCrN8/wIdwz8onSD74ZzzjmhPk4AyN3HRUosYUhLg5YbIiOpn61SBcJn+/0
	 rwtzpMNtnetEvCGV7JG5s1WDMOzO4gdouXwO5kqFk/X/J483ow62bLJDE37PEcVJ07
	 PDfkD31ivbbZj+4OL9WQj946PPd0iEXd9rhg2H4nxO22ddP09BFGT6orW6V7Ljxicz
	 Vff09qbKG+WXlosjWguLIDrLQES4i26ZYc9ZV8MvYD6plfmHzC+gU3gcdtLSW8v59c
	 +OH2iE4x7XyquUhv3j//ZbeujrI74BvPMlRdhLIdgxMshqSvtluB6uq3QZkP9fHBEs
	 6Fz+vqXK10cgA==
Date: Wed, 19 Nov 2025 08:33:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	Frank.li@nxp.com
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: ldb: Document
 nxp,enable-termination-resistor
Message-ID: <20251119-rainbow-wren-of-acceptance-c0e7f3@kuoka>
References: <20251119022946.268748-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251119022946.268748-1-festevam@gmail.com>

On Tue, Nov 18, 2025 at 11:29:45PM -0300, Fabio Estevam wrote:
> Document the optional nxp,enable-termination-resistor property for the
> i.MX LVDS display bridge.
> 
> This boolean property indicates that the built-in 100 Ohm termination
> resistor on the LVDS output is enabled. It is controlled via the HS_EN
> bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
> signal quality and may prevent visual artifacts on some boards, but
> increases the power consumption.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Change the property name to nxp,enable-termination-resistor (Frank).

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

