Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA5824E4AA
	for <imx@lists.linux.dev>; Thu, 17 Apr 2025 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899744; cv=none; b=itXr7gqli+Nmx9ILoC98fhPZCDREudGfbwyP8UjjVJGo0vvzuKhoHafJbrllvfjV4Y908Tjt6NdPjKwEoCn/DewFF3VjHyyPJzNAI2JwI/+0XGTaIb7FAQ37YWCyrRYVPe01X2Shw/cWTuWeLHA0MTKape5fTMCmrPKdTj5ux/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899744; c=relaxed/simple;
	bh=xrC86xvnJkiy2wsi0KaTZ23wdHmrQQxY6hWpQMlw79Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIw0sudT/nQqa2k5O79xA1nBO2dEjemTF7AC24IbiWfFzIpArnpy2oRTnbdwZPf4syLMLo79PCF7fRFL1Hmykkva8G3PFwOvAwCglXO3S8vrkAR7hy4OpYOcz8IVrhMwNSbOO55XY3Pr3tXuYTpNIqKMHcmW43+b4dBfjU+B4PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CuZseRVi; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CuZseRVi"
Message-ID: <13357f38-f27f-45b5-8c6a-9a7aca41156f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744899737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ChiiEwSa59wY7fvBbAy6iv40vz0WXaWqLI1I0LPkf10=;
	b=CuZseRViZ/RaXnYZOACNcu4na/IG6hHI8dgeNeVVCuTSOVxXCs2ZnGodyZUZUH3dWE7CeK
	QyjpUmPSSCLfAhMZ96M4KxFeuPaGKkfxb2/X4sadI1tABc+Cmv/RtAjACgO8b4jAiWWp3V
	8lcI4vehocZ2Igzm1PT46ptOaVKHTGY=
Date: Thu, 17 Apr 2025 10:22:09 -0400
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v3 00/11] Add PCS core support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, upstream@airoha.com,
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Joyce Ooi <joyce.ooi@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Hancock <robert.hancock@calian.com>,
 Saravana Kannan <saravanak@google.com>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250415193323.2794214-1-sean.anderson@linux.dev>
 <aADzVrN1yb6UOcLh@shell.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aADzVrN1yb6UOcLh@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi Russell,

On 4/17/25 08:25, Russell King (Oracle) wrote:
> On Tue, Apr 15, 2025 at 03:33:12PM -0400, Sean Anderson wrote:
>> This series adds support for creating PCSs as devices on a bus with a
>> driver (patch 3). As initial users,
> 
> As per previous, unless I respond (this response not included) then I
> haven't had time to look at it - and today is total ratshit so, not
> today.

Sorry if I resent this too soon. I had another look at the request for
#pcs-cells [1], and determined that a simpler approach would be
possible. So I wanted to resend with that change since it would let me
drop the fwnode_property_get_reference_optional_args patches.

--Sean

[1] https://lore.kernel.org/netdev/e7720741-93c5-450b-99a0-3434a5d535f5@linux.dev/
