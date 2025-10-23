Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6494A29B793
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761239865; cv=none; b=HXsBSacv9zmBX2TzJVI9+V6OMdxEiYuwmz9STOw+VAqMOB+/+vqC9Pv1tZhHhGZZWgMbIs1B56K/GrBIAxr2/EdGcdyQzPLETHR53mXGXf9bqCDEx+E/93smoHPEVkHZfO+M0GiX8v7PiYpa9C2aMB8XB2gV7SxV/5uyc1N0Rio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761239865; c=relaxed/simple;
	bh=sAGYcixA8hc2rJdPBYVrw8hY9B06k+KGm7ku/lneWDM=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E+S9lzuUVWBFe6PVn9RD8VX9Y3sIkRtRJHIeNHwTglH2pUhGcJADt0UnGqKIZNhnM4TkA5bT+XeOQhzJZ5jjpcOrB6j4jdKOp1Z/dRRdM8SHrusVsi6RmQ32rXiIuwY9lPsKrWskZGDZy5xNM7mcueYl837LYokumTwN4pa8qsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cst132Dpbz6M4mN;
	Fri, 24 Oct 2025 01:13:59 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 252171402F9;
	Fri, 24 Oct 2025 01:17:41 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Oct
 2025 18:17:40 +0100
Date: Thu, 23 Oct 2025 18:17:38 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: David Lechner <dlechner@baylibre.com>
CC: Frank Li <Frank.Li@nxp.com>, Jonathan Cameron <jic23@kernel.org>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
	<andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Antoni Pokusinski
	<apokusinski01@gmail.com>, Vasileios Amoiridis <vassilisamir@gmail.com>,
	Justin Weiss <justin@justinweiss.com>, "open list:IIO SUBSYSTEM AND DRIVERS"
	<linux-iio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>
Subject: Re: [PATCH 1/1] dt-bindings: iio: pressure: Remove vdd-supply and
 vddio-supply from required list
Message-ID: <20251023181738.00004253@huawei.com>
In-Reply-To: <0e00bb14-19c7-493a-9629-354bac3a273e@baylibre.com>
References: <20251022164154.2994517-1-Frank.Li@nxp.com>
	<0e00bb14-19c7-493a-9629-354bac3a273e@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Wed, 22 Oct 2025 12:03:27 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 10/22/25 11:41 AM, Frank Li wrote:
> > Some board designs connect vdd and vddio to the system power supply. Remove
> > these properties from the required list and make them optional, since
> > drivers/iio/pressure/mpl3115.c does not use them.
> > 
> > Fix below CHECK_DTBS warnings:
> > arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: pressure-sensor@60 (fsl,mpl3115): 'vdd-supply' is a required property
> >         from schema $id: http://devicetree.org/schemas/iio/pressure/fsl,mpl3115.yaml#
> >   
> 
> Why not just add the required properties to the .dts file?

That would be the ideal. 

We had a long discussion a few years back around whether supplies like this
should be optional or not in dt-bindings. Conclusion (I think at Mark Brown's
suggestion) was that the rule should be if power is needed for the chip to
function they aren't optional in DT.

The driver doesn't necessarily do anything with them, though it probably
should and adding simple support is trivial. 

In a given downstream dts if people are happy to have the checks fail
then fallback regulators can be used but the binding shouldn't reflect
that bit of papering over missing supplies.

So no to this change. 

Jonathan

> 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml b/Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml
> > index 2933c2e10695e..04703a01cf7af 100644
> > --- a/Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml
> > +++ b/Documentation/devicetree/bindings/iio/pressure/fsl,mpl3115.yaml
> > @@ -47,8 +47,6 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > -  - vdd-supply
> > -  - vddio-supply
> >  
> >  additionalProperties: false
> >    
> 
> 

