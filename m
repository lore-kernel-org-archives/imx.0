Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446252D600
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147126; cv=none; b=j12T+RuuJxhZ5sFYKPsj0wv3Pu36s+LpWrTyzqEtnkOLljf5oiL6+EDyy6svaDjQTNxcce7qdcunDUVyqfGEXp/wPN07abQFX2WP0v8LZqIcapYG3yCU8zdYjdhDFERIODVRN7IG5PEYoQC/j+przpCT6paUchAS6UhJekOfDN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147126; c=relaxed/simple;
	bh=awVHU3gXrjHE7tKmYneTP2+PaG8+KpDacT2GKYKtdbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mio3LunNN62vRBFx6cdo9sMb/Q5tvj0mtd2ONE86qcMGIVIUInikInXY89Pj6NP5Y1cdWcbzfbBmlCgU7O3/ua5H+NxWxMHKvxyh28AWQ4qOMxnivVBshmJN5cpdet2yy6bpPb6MuO2ww0im19/RCWy8yPh1JbHSrmDlqk3kD1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pFoU0USx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pFoU0USx"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B9A822E;
	Mon,  6 Jan 2025 08:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736147067;
	bh=awVHU3gXrjHE7tKmYneTP2+PaG8+KpDacT2GKYKtdbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFoU0USxLOmfN/9R8xKNakPqu5uHUW6/gLaq/jL3RANdfHywEFN2OUz+BSoInw32J
	 XEBwIzsIzJofCGWcZ0EhoX0QAaWb52462LDZElVeLwne2JMUUCjvp11SsTyXDKH02t
	 bmw8pzoNX+ZaWmaLOJTGVkl0V3xlMVfvryCR/+Rs=
Date: Mon, 6 Jan 2025 09:05:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <20250106070514.GA5568@pendragon.ideasonboard.com>
References: <20250105190659.99941-1-marex@denx.de>
 <20250105232219.GC21164@pendragon.ideasonboard.com>
 <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>

On Mon, Jan 06, 2025 at 03:48:52AM +0100, Marek Vasut wrote:
> On 1/6/25 12:22 AM, Laurent Pinchart wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Thank you for the patch.
> > 
> > On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
> >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> >> HDMI but do not contain the HDMI connector node. This flag allows such
> >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> >> use this flag, do not proliferate this flag, please fix your DTs and add
> >> the connector node this way:
> >>
> >> ```
> >> / {
> >>      hdmi-connector {
> >>          compatible = "hdmi-connector";
> >>          label = "FIXME-Board-Specific-Connector-Label"; // Modify this
> >>          type = "a";
> >>
> >>          port {
> >>              hdmi_connector_in: endpoint {
> >>                  remote-endpoint = <&hdmi_tx_out>;
> >>              };
> >>          };
> >>      };
> >> };
> >>
> >> &hdmi_tx {
> >>      ...
> >>
> >>      ports {
> >>          port@1 {
> >>              hdmi_tx_out: endpoint {
> >>                  remote-endpoint = <&hdmi_connector_in>;
> >>              };
> >>          };
> >>      };
> >> };
> >> ```
> > 
> > Are there any in-tree DT sources that use the old bindings ?
> 
> See 
> https://lore.kernel.org/dri-devel/AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com/

Maybe I'm missing something obvious, but where is the patch series that
moves the DT sources mentioned in that mail thread to the new bindings ?

> The rest is fixed, thanks.

-- 
Regards,

Laurent Pinchart
