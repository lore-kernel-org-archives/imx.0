Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F981728
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736179019; cv=none; b=ugAUTTb0cTTrHDJmd+PIg9/czO7k0Br7xZGFckCPSchBiJU884Y3F77ePTg0kop0wD3ByxCIB60GStBfS5frr0xC2cA1I8d7UL41Ix3ql2bXx9TcQpPKiEEkDKIShE0sbnNw1AwkIY9fV0QEnvEz/R+CVBvUY1QOMwp7SgrpEew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736179019; c=relaxed/simple;
	bh=m4G4sp/GWSPNBk2U6hQREs4YdXlRNqrxfvcawNfVRKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXhqfQbu4oUBrFX6kfpsW19ejtz+p0Iap8HI/fQvToJ/GH/pRli+wkCJKxd7n4ghIROEAyiRneAKtyUWQ8+ztHlJgESPlHS+/CeCT0QxrQXjXiDg+S1IgJCmc1GmL7n6qTP4mXWUzANX1tOqiUfKGX3osU6mGntuwPnwAB+gCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pOVTWHMa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pOVTWHMa"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 109D2520;
	Mon,  6 Jan 2025 16:56:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736178964;
	bh=m4G4sp/GWSPNBk2U6hQREs4YdXlRNqrxfvcawNfVRKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOVTWHMae7VYOpCYkBMbUzkiqGAEKZWPLoCkEBCUJlNZ77Zd4O8jR34HcFsq+jytz
	 JeifhstPX5yXIPbk/xhEZlUTFfL8RvOMri+TRXD4j4gWnsSN6TLmTyici9RIk88BGN
	 vSvZu+vkNCbhdiA8dJfR+AeG+IKfGf+8+39i7VL0=
Date: Mon, 6 Jan 2025 17:56:53 +0200
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
Message-ID: <20250106155653.GG10308@pendragon.ideasonboard.com>
References: <20250105190659.99941-1-marex@denx.de>
 <20250105232219.GC21164@pendragon.ideasonboard.com>
 <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
 <20250106070514.GA5568@pendragon.ideasonboard.com>
 <add68d4c-51d8-4c1a-9560-7c95213dd524@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <add68d4c-51d8-4c1a-9560-7c95213dd524@denx.de>

On Mon, Jan 06, 2025 at 04:36:26PM +0100, Marek Vasut wrote:
> On 1/6/25 8:05 AM, Laurent Pinchart wrote:
> > On Mon, Jan 06, 2025 at 03:48:52AM +0100, Marek Vasut wrote:
> >> On 1/6/25 12:22 AM, Laurent Pinchart wrote:
> >>> Hi Marek,
> >>
> >> Hi,
> >>
> >>> Thank you for the patch.
> >>>
> >>> On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
> >>>> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> >>>> HDMI but do not contain the HDMI connector node. This flag allows such
> >>>> DTs to work by creating the connector in the HDMI bridge driver. Do not
> >>>> use this flag, do not proliferate this flag, please fix your DTs and add
> >>>> the connector node this way:
> >>>>
> >>>> ```
> >>>> / {
> >>>>       hdmi-connector {
> >>>>           compatible = "hdmi-connector";
> >>>>           label = "FIXME-Board-Specific-Connector-Label"; // Modify this
> >>>>           type = "a";
> >>>>
> >>>>           port {
> >>>>               hdmi_connector_in: endpoint {
> >>>>                   remote-endpoint = <&hdmi_tx_out>;
> >>>>               };
> >>>>           };
> >>>>       };
> >>>> };
> >>>>
> >>>> &hdmi_tx {
> >>>>       ...
> >>>>
> >>>>       ports {
> >>>>           port@1 {
> >>>>               hdmi_tx_out: endpoint {
> >>>>                   remote-endpoint = <&hdmi_connector_in>;
> >>>>               };
> >>>>           };
> >>>>       };
> >>>> };
> >>>> ```
> >>>
> >>> Are there any in-tree DT sources that use the old bindings ?
> >>
> >> See
> >> https://lore.kernel.org/dri-devel/AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com/
> > 
> > Maybe I'm missing something obvious, but where is the patch series that
> > moves the DT sources mentioned in that mail thread to the new bindings ?
>
> Since this optional flag is added, that DT update series can be done 
> separately.

It can, but I'd like to see it merged in the same time frame as this
series, so it should be posted (and reviewed and tested).

-- 
Regards,

Laurent Pinchart
