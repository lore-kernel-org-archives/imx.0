Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B1B231852
	for <imx@lists.linux.dev>; Wed, 30 Apr 2025 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019039; cv=none; b=Y8v0UPM8Znajs49oj9O/mR2saXKuP1gRlJ1BMngJgBDoYHzokSCCWq/zqVZLUruuXbQArZghpGaC4+L35joBpZI5+pI0AGoy30A+9KzSLzFPeLFc9xNN4uynYl+oORFI0kjLboju3VBSPTfZg5UAXBRlfwkeMN2pZNEApjKtst4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019039; c=relaxed/simple;
	bh=gUxFERNFiI8Fti0Ax2R+rmqI6Qrh+qBwEPYn2etkdf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZzfPsy1jGBlY7YK1Ozg5QoC9mel2KuKkmd5hbt+RWxcl9SpR52A4aoayq/IdMqTc8JTgofgzZl+WcSYWSBRDHmJcvDuK8B+DDQRjCq/J7hK6szxI80fQ9tvMsu+LcnuE80aQWrR4Tx8X9OIkLtPAWuDWsoFLfNFII78bdbLOLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GBd/rYbS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GBd/rYbS"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D23A5725;
	Wed, 30 Apr 2025 15:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746019029;
	bh=gUxFERNFiI8Fti0Ax2R+rmqI6Qrh+qBwEPYn2etkdf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBd/rYbSg20QCw/0EwavmiKXQtw3vQlPHdqZzwD9mrtld2/hrPn/nB3Q1oU2/Ybag
	 zNZ1++QaKWcnvbMpMLWhqhp0BdevlHUyCmFl/mDiAVuMNUKFTm4SCZgKGVb2ptrF9z
	 H3eA7KcvL9Wn3n0ahYev0FZp2sRvK8ToeaN8XPIA=
Date: Wed, 30 Apr 2025 16:17:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
Message-ID: <20250430131706.GA25516@pendragon.ideasonboard.com>
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Wed, Apr 30, 2025 at 02:53:22PM +0200, Niklas Söderlund wrote:
> Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> frequency and pixel rate") the driver expects two specific
> link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> (222750000, 148500000) operation. The driver fails to probe without
> these exact settings.
> 
> Update the example in the bindings to match this to make it easier for
> users to incorporate this sensor in their device tree descriptions
> without having to read the driver sources when the driver fails to
> probe.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The new values match the frequencies that the device expects for 4 lanes
operation, so

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> index fa69bd21c8da..990acf89af8f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -136,7 +136,7 @@ examples:
>              port {
>                  imx290_ep: endpoint {
>                      data-lanes = <1 2 3 4>;
> -                    link-frequencies = /bits/ 64 <445500000>;
> +                    link-frequencies = /bits/ 64 <222750000 148500000>;
>                      remote-endpoint = <&csiphy0_ep>;
>                  };
>              };

-- 
Regards,

Laurent Pinchart
