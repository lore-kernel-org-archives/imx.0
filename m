Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6031D1CAA84;
	Mon, 13 Jan 2025 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736775435; cv=none; b=cIJySBckNoayeN/IU5atBknGGRTU8TQxsXbxIMFS89kEzhNnVr3jeIFUwB7LT90D1wJcKjTPuUkJ7fLchVDydHXJXvZL8pP3//hMEtmySlLurUHGuoxDuDnj0hiF1ke0sKRy7yT+3QButMCTrlel3gx+1MKzcOJ5xCphTRtPI4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736775435; c=relaxed/simple;
	bh=lELgVVZb/aNmH72dj1QI2MDg3lY+QkcKnIks+qVNCmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHlRc3+gjhudSAbqk3yVx72ib8ecwkv/VkNGZSb98mKnX0PTyBjpW3R1IU6xBjmRG9pBlY4Ycas6KXlVo8T+etqV/GTBnuloPJ01ThZrtlfHeiBSyBakIlHy8nj5ESORGp1BhOc6xkeCldxgkUXxqoaFCHRx9YgMpjPugzwGw0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oL1faxh2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oL1faxh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8046C4CED6;
	Mon, 13 Jan 2025 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736775434;
	bh=lELgVVZb/aNmH72dj1QI2MDg3lY+QkcKnIks+qVNCmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oL1faxh27U483scWPa82dvzfcB7nPievQ/2cqmZAX72B6L6xxWLJ5XFiftrOBEZNT
	 1qGEIz+BysMyIiDe65PgvYW0Xzt8RFbTm9ivWWZCnCHPajeZrYtq98uyekQmJmfpd8
	 9SiKQYYQrVJaCFbK1dD0jIpWocGI9P0+QbHRKRDcgbx0oPjAX+vwAkDtAKX/bkCCdO
	 66DGsXOV0Mp1PLUCQMJNEUuTyzDdkBcjcsWD6RHQUzun2dW3nAZ5j7QCYBPL5PDVXO
	 TRTsFT5oJ++osepNhNz7dZdvYewkkLmh/AZz0hypNYD3BAiaP414bd7aCZnYdt1zen
	 OfljdjI4zh5CQ==
Date: Mon, 13 Jan 2025 07:37:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: francesco@dolcini.it, aisheng.dong@nxp.com, kishon@kernel.org,
	airlied@gmail.com, devicetree@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, kernel@pengutronix.de, tglx@linutronix.de,
	linux-arm-kernel@lists.infradead.org, tzimmermann@suse.de,
	festevam@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org,
	dri-devel@lists.freedesktop.org, shawnguo@kernel.org,
	agx@sigxcpu.org, frank.li@nxp.com, linux-kernel@vger.kernel.org,
	s.hauer@pengutronix.de, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, simona@ffwll.ch, mripard@kernel.org,
	imx@lists.linux.dev, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v8 06/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller command sequencer
Message-ID: <173677543230.1686186.45544377121474108.robh@kernel.org>
References: <20241230021207.220144-1-victor.liu@nxp.com>
 <20241230021207.220144-7-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230021207.220144-7-victor.liu@nxp.com>


On Mon, 30 Dec 2024 10:11:54 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller contains a command sequencer is designed to
> autonomously process command lists.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8:
> * No change.
> 
> v7:
> * No change.
> 
> v6:
> * No change.
> 
> v5:
> * No change.
> 
> v4:
> * Replace "fsl,iram" property with standard "sram" property. (Rob)
> 
> v3:
> * New patch. (Rob)
> 
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

