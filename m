Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF7B14EC7F
	for <imx@lists.linux.dev>; Wed, 24 Jul 2024 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721814512; cv=none; b=N0L8fuHt0CekJFOEiDckoXELkXE33swGrDBweHJC7sMRb0VD+pjaHs/kzY65MP9WYtiv/KVQjREcW57ET5kHzeQzuPzq/bAh8r5JkKuVp5Uauxp7KqPXbe3ARLcaj6+JW2pBdM0/bNRbIaULyPp4+XMstvlb+/fN/3qC9fE4uHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721814512; c=relaxed/simple;
	bh=zhyGAkgiYXZKzBX1lPo8Ir8D5zRMCA1ao5OxXexUrAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnOboNO4wXHEf0IaACE/dI0Pq6qwBGLFOxNoKHOFJTAGJgzDIV8X8AljDu+dExooVle2vettneRIsuRGyYVa9qSsiDnldOeMDZGfTAyrl7al60napbs/zq2Q3iyPRZkWJwIGYy5TRgTdnNQMdDL/GwsjJrVlcl4CxAST+ekc+gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=fPExpLab; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="fPExpLab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1721814495; x=1722419295; i=wahrenst@gmx.net;
	bh=zvwYrD9Z83+AFqmQ/FUEGTRUuxdNv9MmmqDBRtPJ/mw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fPExpLabKeufc31m7pwSPVyqmBiOCCb0SCB11zq/f13HwwKwYovqiV4I0+1NyEbS
	 tjm3r0vk+VjoiUY2TFdZgQGGZcxN6oKep+M3hwdSF6h8j6dUaSuOawwSZ4p8vOXQ+
	 wXI+NBWEG6sbtKa1uD+a6nX4q08WUTl1BQcXxe1cfdU5M3Uqyh9Gk+90m5BujpHjh
	 QDje0suiltzqtD0yROGRf8f6CjHhjth1+xard1TpQUgzx4t/q+RyNjhj6RC1vBOXD
	 C9OG+B5y96AHaEEBJ7aFitukuSrYi8HpDf/k3/Z8i9XmQbYWbPTXqvYj7KhuSAJwK
	 jmqmDCkHvod+KH5saw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2jC-1rtQR23Ux8-00ZDPl; Wed, 24
 Jul 2024 11:48:14 +0200
Message-ID: <a029009c-884e-4235-a384-76090e4ccb5f@gmx.net>
Date: Wed, 24 Jul 2024 11:48:13 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mx93: No cache hierachy definitions for ARM cores
To: Frank Li <Frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 peng.fan@nxp.com, peng.fan@oss.nxp.com
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <bffb5d44-4eca-49cb-8624-e7bcce525fbb@gmx.net>
 <CAOMZO5DDk6eX+Ad9zKZmaEVvRHwFDETwuA=J7366QCRqhq_ZLw@mail.gmail.com>
 <Zpp9kRkEMXkp3d3i@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <Zpp9kRkEMXkp3d3i@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rXrDVjEeSagIotGRNnbd2wKT6XOIB9fii0QIC/0InDBIbBD8QKs
 /f/fTtruRG63+6nOnP2JNaKEL0S+FE9S9477QynnF/8jGL75oquQez+PO/5mjL5Veqm8+6e
 ReCvzJmQUeOnOgfagcBHWZ7dNggAAd92mrBQ+daTSUsmALqniSRX6n4sm4/hu21yUQUdqxm
 FAp5yOmioYEWOmLVdwz2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vkEM0o5CSSw=;AhLXX3PtU7OObKXUXtDnKEVFRba
 or/JSUAJiM2vmnhzL84cnNmpSAcZXGtCEOaFCo8b4jXzVla9dQhLC842WvILzVJX6emvoDoVE
 cZHkZGGs1+3SG9BPS5HptyClSKG2Xvh/iGXez1sXdxAZlIoH3T+5jqo7dvOGsQ70gU/Sk0DSS
 evkT1y6Njs4Pexkvrrcvdw0jhMP58lJ1R9Vf+ECOuB9y1MH+PPFrkRw0h+ZZY99EsT9/WOYIW
 eNRxVoITK1mFV3wSw3fWZw10BFI5t1nBKSeJqo5GKUepJAVeMFXaxfj0iDNnMdUnA5LKSszcR
 AbzfW+Vrn1jR4oE+2icMecK7ekr7k6VjRjMId5M5gHkYEC6gA/ZhB4bGZrGbyH7WdbImyBnGt
 zs+VFDrZKRQs7PELXTjOD10etdvXQZ6jElwQ7vaG/k7Pv3SlLlgrOFkSHzU3zjkMkvc9S8yln
 CSZqSAku3GMR/MaU9nonusZQj9Di5pRF+vXO1eB5wvaHeQ6/zcB4y6I+gYUyKaATM0RUSuZc2
 G1To587mW3f6XrErfyZebCZRRPzWi2thYmAk7clPbmIv74QyBXdM4Gl60INq5vbC9LxxIgtRc
 HDyFQWf+kfSHyKJiFuCAxbimsypOxp3I7dloqFc740SMG3c95PaFG3wes09iIsz0jq1LQ1Gau
 0RKcSTEd0zVWCNKJVA2oZr7DYKs+2HgVTCvlwcPPOTi60wrprgTLRFKZg89DbCoWw09EVSaK1
 zH5+5KiG/wljAJHMwk4QEuaGkGdTBzS85z7v/LCKIeBFp5P2Y8nZ53OzIjLaAg8JtEFIAlxZO
 7ouPUra4WVt7oCNOI+RBur5A==

Hi Frank,

Am 19.07.24 um 16:52 schrieb Frank Li:
> On Thu, Jul 18, 2024 at 11:38:20PM -0300, Fabio Estevam wrote:
>> On Wed, Jul 17, 2024 at 2:49=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net=
> wrote:
>>> Hi,
>>> today i noticed that imx93.dtsi lacks the cache definitions for the
>>> Cortex-A55 cores:
>>>
>>> cacheinfo: Unable to detect cache hierarchy for CPU 0
>>>
>>> Maybe someone with more insight can add this to the imx93.dtsi file.
>> Frank, can you help?
> Peng:
> 	Some informatin missed at public RM. Can you help this? I found
> it also missed in internal tree.
does the official ARM documentation [1] provide the missing information?

[1] - https://developer.arm.com/documentation/101051/0101
>
> Frank
>

