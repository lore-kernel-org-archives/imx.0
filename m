Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A942F6E2
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122165; cv=none; b=UhIFVSVqrZIi3xMmlfK/4NU6y6XJvlHbxctF6zSZyqWdjd0P4OKWKclEZYfMx9i+dknJUODKqmbC+OIUI3TRTX904f/GJdouMEJDYK7NvZXwdgAlOPY3F8aTd/md0sBItBpydINaVn8H2+vHThptVjhJ7FZ5iUqR0WcLUzIN2nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122165; c=relaxed/simple;
	bh=IzxSwCrhf8d9FMRhv0k7DfYYSIK+phpr001usHYVJgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nh6b4VAgf8C6m5fPruZTf4X+6ocH+BoEd0oNzeo+GuJD+wHlEHUcQbYZqDoD6Iu5JlKwWGUBZQPGiPDaZjQcX6W3J2nsFKHPih4prkv98SqiR552nOSDi0kMhXp2Txq8cyHPUp0mQ12fuiB8qhhAFGdHVBENPIRKiYr9s9pGqXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNuMl10J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJP+2KQy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNuMl10J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJP+2KQy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kbbC3686775
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 10:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tDweQGfiDsekOj0T2784PA2rCFWCh+RkBLsA7n7s2rE=; b=iNuMl10JnOkrBvNr
	n2Y5oDnpdHx5rpmFkY4AD9L4wOL2CfWozbGj6GhbcPVGy+3azf9v4cMvSdc4pIq3
	G+MdrFSluFt83raNUpUP0UgtTVrWwCuJYCkSKmR5HHMfJ32Mk5a/8vAq99sgNa24
	OlAjL1QV/kJHxZPM5dI2gO3EMkt48/QnighBWtrYMyabnjUvBmMRCzBPpzw746T/
	q/aZcrQFU7Aym4wZYhN35EC+JO2ecMJLAgFgpUBiMWRU6fhkUoOqBllIpKAW2P0q
	idi9EplvOYdiRzaWbWdDanAPxindBPXXbxi5bBb+ekEoF5vZ/mRjM5Ciy3m7oWz+
	WLnm6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg1au8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 10:22:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939e1847252so277125285a.1
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122161; x=1789726961; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDweQGfiDsekOj0T2784PA2rCFWCh+RkBLsA7n7s2rE=;
        b=LJP+2KQyiAYaAx3JrfAOebQCdJ3Wm3ooo+bEziGrdCZWyMgyrNL+32v3Xu9GpeeorY
         aQIuSxMvOdcGEKYTzng4yp/VYaaCyhBzbMexKJau4i8f1sYEx0PSZyDXGj7kivfs3H2d
         FM6zOojDmBh+f8TClzwOMBu1uvomKbfHCEOH4+dan3R90Ek9v73r8riUIL/B3hcHde2M
         4hi2GpDBK+olE2zat0e9KB17qZ9sMM7iL+oMJcQXmY66nRyaz2k6tQ6zfuJSW+i8q35Z
         umZI7vHT/VWtaUzT2Jwa94dhWJ2DIH9tQicyi2EtRx6X0fma4hw00350R2arwhSyoJub
         L/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122161; x=1789726961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDweQGfiDsekOj0T2784PA2rCFWCh+RkBLsA7n7s2rE=;
        b=MXCD4OSTdCPpoKL8xtfyH8NXAwzxrXnegGnaoaI1IlkKQHb/tQZGsY4DdwvhrSB5kE
         juleRKcp1x8z2OMkPBE7ly8SQz8sWL1SOl/TidW8IVCOoMHsyA1sHtJ82CfvH0tcyWMF
         HsQyvzYTw9pxpNY138DeT/8AcX8YiM8qVSdCNH7CMUTXRuQVE9518i5a+7+0BqEBiBDP
         fcTLK8PhMcZREadndSGd5pO0H1s+0dvQmYkRLcETeJb+exY5qdrln5YoQVYJ8LW95afT
         3HOh2jF4GFHr8yZ3FCYpyqijX55q8ZQckRY3HXGsLhu1xMe6Q26y4mD2lXVjz+Z3H6WF
         ZeJw==
X-Forwarded-Encrypted: i=1; AKwUvBxRaR2Og6qU8jlYBhwALyvnCTFMvlFwRbOsq7Ws62JDGWpEMAZNjkgl3ffvN7LHcZ/bYYM=@lists.linux.dev
X-Gm-Message-State: AFuF++nyWjLAKkjxx3sxynNmD/kSmsH4dGXC3ee2OQqhKw1dI0j+1tlb
	N4pMO+B89W02U6r7AeHzv/choyDAVPoWjTKUPTUnkM7rug8riXpbHKL9j4r9Rf0gzgJa64RFOR0
	FaIL0aSHHAviZPhs3t2wz1GPeCtQvmYF6b9Ny3DabNQII5/tcmuRraWs=
X-Gm-Gg: AYBFou3sK57Uib72jbUcjliU7h4SAighY8/pNjE6hLqBj4Lx1QZhUyUvFXDHk+th2KQ
	vGfO3a78AdJYxJoiWMEo1FaYltVHFF9IXT3mdUAc+n/Ph3Rg3OAP+t7bQ24Ac1R8kFlXteVaUDf
	sMSERZVqHCurvb0+clCMfDd+xsottTjFXdZ4OxqrDV2t+gz2zNlhFFBMX3HALW65ciSB7R4KIE0
	PZ8ioPFDQbQzJqDS6Wz5vYoP5Dwt/ZpYQ1n5cS/jKA6Q4HcG6EGCVr+FSUcx1jb68o7UQxeVLq8
	Tfy12gLzy2FZbOtEKYe6As7ztJwuQ/n95tVZQr3PoSn1syNDpUFqkecWbd3yDQKCYJfBMhVc6R7
	FFFZTUOaa7W8bZVA2GJfVYJJHfIzcmLuNWW1s67gG8MqxT50i1aI+bpzK+IXLCjI=
X-Received: by 2002:a05:620a:4482:b0:939:c7dc:8712 with SMTP id af79cd13be357-939d7eaef14mr1043310485a.15.1789122161381;
        Fri, 11 Sep 2026 03:22:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4482:b0:939:c7dc:8712 with SMTP id af79cd13be357-939d7eaef14mr1043304085a.15.1789122160909;
        Fri, 11 Sep 2026 03:22:40 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60a8a89esm63701295e9.1.2026.09.11.03.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 03:22:39 -0700 (PDT)
Message-ID: <81b9d76d-6036-45fa-8dcc-c180d102ef64@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:22:37 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] ARM: orion/dove/mv78xx0: remove all board files
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Stefan Agner <stefan@agner.ch>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade
 <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Kristoffer Ericson <kristoffer.ericson@gmail.com>,
        Ethan Nelson-Moore <enelsonmoore@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>,
        "David Hildenbrand (Arm)" <david@kernel.org>,
        Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        Alexander Clouter <alex@digriz.org.uk>,
        "Jeremy J. Peper" <jeremy@jeremypeper.com>,
        Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
        linux-ide@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-6-arnd@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260908152808.3928630-6-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jknZZ85QzmSf9cO6Ja2R5YiBW4w-oiqO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NSBTYWx0ZWRfX1xAyCFbmdpvR
 vaWVNtf6vz3rVjFdV6jEwfcDZa1AySUG+CrhkohzE/P2gcwCaWeo3dsGSdyHJhq0FWkzHWjdh2E
 zl79qjhrFDr516llnjZHuJ7F4fjg0sU=
X-Proofpoint-GUID: jknZZ85QzmSf9cO6Ja2R5YiBW4w-oiqO
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3d672 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=P-IC7800AAAA:8 a=qUSviUioAAAA:8 a=bcVNC_F_AAAA:8 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=_jlGtV7tAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=LCLTMPDaK1Elu1LaZkAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22 a=NaVVo_BLbmHoeYVcMpQ9:22
 a=XlnQEC-7T2amSQPCFme7:22 a=nlm17XC03S6CtCLSeiRr:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NSBTYWx0ZWRfX5nIOeoib5RT2
 4vGRLrXBnRC4euHBMWYNb07tfsZVk+4VdwWB4M7nbN7jZHOQF6hn6jeYJ68jQpNo5swmj00KJXD
 ham+885rDzPXmHNoPh2M+Kx3hwn9ooMdAkajjyB3p3TFgCcKwyRWYQAWCBii2B/FCEV3TADbDCS
 0u8TCjXAgug1nfjYKiGOXqd3JT8h6vceQyj9iuY2IM5FoOFQr3eSkldg36/V050UtRIkUWQYX2V
 T87Le5u0jn5likqGjcDRZXKGXXSnqjyEttfDs8Y/4Igz4B6HKueSRo+BxktYF7j/lDnBmQNb7zV
 yu6NByRfXZ3bNbO0ys0oVUbBb5GNXnOzUrHMgp3ajZ6/1zWM0L1eco2Dvjzy0LYdFo8A1V4psYi
 Q3mTJHp+47/cHMbWAIL/aCRdcDtqINu+vyfzfF8IUhWQeYXfE1LiwYe2dKIPxO+djCGbiyQqtbz
 poB0BCoFe/hDkyqUwwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110145

On 9/8/26 17:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The 'orion' platform is the predecessor to what linux now calls the
> 'mvebu' line of Marvell SoCs, and originally covered orion5x,
> mv78xx0, kirkwood, dove and a few others that do not have any
> upstream support at the moment.
> 
> Only a few board files remain here, these are the ones left
> in 2022 board file purge because they had some level of support
> in Debian or OpenWRT, mostly for commercial NAS or router boxes.
> This distro support is now gone, and nobody has converted the
> board files to devicetree, though the orion5x and dove platforms
> also come with devicetree support for some other machines.
> 
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Gregory Clement <gregory.clement@bootlin.com>
> Cc: Alexander Clouter <alex@digriz.org.uk>
> Cc: Jeremy J. Peper <jeremy@jeremypeper.com>
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Cc: Niklas Cassel <cassel@kernel.org>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Thomas Weissschuh <thomas.weissschuh@linutronix.de>
> Cc: linux-ide@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> # thermal
