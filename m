Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450B91598F4
	for <imx@lists.linux.dev>; Wed, 24 Jul 2024 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721836547; cv=none; b=W2Xu8kuJ7QKgjiJOZQ+erWnHLqIKnk9vyq4Qgg4roVCfmB2QFHvfrMSxlIWTq5xhklFIeA57xd0AWD6dMmm+2cgksTunSyNPuInrNTrCsHjFNnjFpUoFNHpRpyznzhiuEorSBdm+VP0eFecn2BB/UQkbTNmXlNfz1wqZh8A6xwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721836547; c=relaxed/simple;
	bh=7YShGFJCfE5raZzE0sLB2z9rukp9MhjPDLAUYlNRNy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGworpf/hqOPiwR8OHMV5IEKLId1v76LALtr1VqJqGbOk1UqyN4sxoXT0q9XkMzlnUb9gXI3EVrOB09QDbzsZEaxzh62botjTCRewIfr37XsgWIIF6Qfd4EDSEixsaNzD5Z9nREeUUYuZgVOLTsWPTC8GgGYayE8LE7Aaxen8cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=QD/ZR2yO; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="QD/ZR2yO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1721836530; x=1722441330; i=wahrenst@gmx.net;
	bh=gXgqjWGgWPG9ZvEyDOkUulQF/OrTWnej4NsqEH1mcrg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QD/ZR2yORrS2zgUcqroaADSmTHeufqEz4cdDjm89USCKk2QviWRDvZ45fDq+QO10
	 EVuVI5/DU/+4/iPhiCRqclgCKO03e34LMdJt5nd/IfuGaoyl1BRUeGvWupIw9pGUg
	 J5rnbchk+U7u6upiscZBC4idIfmzV3B9oYSzjRVgdCvr2Ct7YTDhiCaCHLTxC21Ew
	 eZqFY1WpW2WJgpu+cVLXbfglMpuwlyzz4NUcX8Ecurh+fdUBUFsxCAWJKUQIzf8Xv
	 VAVjKyJGRviv5PbK2nmQxBGwidSYFqCWgw21dxd0zTuzqhVHIQBFEE187OM+PfEHf
	 D4iSA2kZSSDeZSgWAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MulqD-1sFWnB16qR-013FeE; Wed, 24
 Jul 2024 17:55:30 +0200
Message-ID: <8c4e26f5-cf28-44f6-8b76-c80832cfe1a2@gmx.net>
Date: Wed, 24 Jul 2024 17:55:29 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mx93: No cache hierachy definitions for ARM cores
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Frank Li <Frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 peng.fan@nxp.com, peng.fan@oss.nxp.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <bffb5d44-4eca-49cb-8624-e7bcce525fbb@gmx.net>
 <CAOMZO5DDk6eX+Ad9zKZmaEVvRHwFDETwuA=J7366QCRqhq_ZLw@mail.gmail.com>
 <Zpp9kRkEMXkp3d3i@lizhi-Precision-Tower-5810>
 <a029009c-884e-4235-a384-76090e4ccb5f@gmx.net> <ZqEQ4vOVvMIazIKc@bogus>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <ZqEQ4vOVvMIazIKc@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u8HU8INS77uJ7wVQJy9DjbK0xl5kuhAg7jviEk6/Qt+3eg19KYd
 FpOD6r4QuIU0ifi1xWl+rMWD5y/vi70YceJdqU/CZhRgtF24R5ZV2ec7QKT4avFoIVHs/SA
 e8+zv2KW/Jfgl0MzYWS1z2bBvdkKIpAXTjvl0jLaUC21wS/4NynnyqwHuPCb5v5ohfsgrGT
 8n1QuSRCzr/jjNx2mNCBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cNS7v/nWr3Y=;lozkfBaF0a6+jvrnL9AC7FXI+NB
 s5S3SkgMZSE6IFZm3MZDK+RRSk2350+OjNggO/OlY2UCufb4y1f2eMPszYyJS4eWzUm32r3Gt
 MrMIWLSpfeg7E32T+VqaMCRaFyJZyzDoKWHuDci0SXnSDNEB9Px/YoyJWqjghDGfkRH2OOisx
 awMECsF5WJ2ZQ1S5iXk21LXFgROJ898hy3uxM2nLIIPRPrFsnV0znocmOEkisNOd4s1qFeBq2
 fSDiJoFSepw0AFHv1v0uBMAekN7SSoJqi2wTxLpSJ95VjD/798tZlax/iokzc2q1q8NOiWTHB
 YotOZmVGtqIBDboHZVsHPSN2PamFFMHN2P7hyOi7DUk8lqdCOJxefYGPHo2hlJrap1VJExNru
 lVmG+c2wnC7FGFE/5i1/ONC7K5FJ5jClNnRF4WcC5o1HJtUxZy4xxQQsAPj/WyPXiNSEsMrPT
 sxGtck1rRYcQ+mu2H1t9BEWFmfaZB+0RGv1SKZWtLUnuYf4mHctbcFMuZwqaNrsJrbzbCzAFi
 L+4ixi5DxhgiArIA0s8W5lmDobdkluCY31XKrNFBkspaEw1D22XbDJG49+zf9h36ZjRiv/E5U
 44CPXtNLfe9MphkV+zpuBYMkqJ/U9O/ImuqEYAN5AHycZIEUeatvex73tKplHWwits8RJR5h6
 pHPZGwhWH+31PO/rN9I1W8fPVIbsNMaMfF52vpGh59pCq4N2/r9X2drZcwxsQFqiZeP7FGb5A
 MsMlmLS+Ti+N7+foDZr7W9BXqKLIb3IFEO62+Z+bOr6uXYmBD+2o5uIL/jmNb+/h+n6VwMkCy
 0y5H22UE3xr7ieSk19GBPnNA1cO7gwZ8UK7bN+KFhiMNY=

Am 24.07.24 um 16:34 schrieb Sudeep Holla:
> On Wed, Jul 24, 2024 at 11:48:13AM +0200, Stefan Wahren wrote:
>> Hi Frank,
>>
>> Am 19.07.24 um 16:52 schrieb Frank Li:
>>> On Thu, Jul 18, 2024 at 11:38:20PM -0300, Fabio Estevam wrote:
>>>> On Wed, Jul 17, 2024 at 2:49=E2=80=AFPM Stefan Wahren <wahrenst@gmx.n=
et> wrote:
>>>>> Hi,
>>>>> today i noticed that imx93.dtsi lacks the cache definitions for the
>>>>> Cortex-A55 cores:
>>>>>
>>>>> cacheinfo: Unable to detect cache hierarchy for CPU 0
>>>>>
>>>>> Maybe someone with more insight can add this to the imx93.dtsi file.
>>>> Frank, can you help?
>>> Peng:
>>> 	Some informatin missed at public RM. Can you help this? I found
>>> it also missed in internal tree.
>> does the official ARM documentation [1] provide the missing information=
?
>>
>> [1] - https://developer.arm.com/documentation/101051/0101
> I assume you meant [2] instead of [1], as Cortex A55 and M55 are differe=
nt.
Sorry, you are absolutely right.
>
> --
> Regards,
> Sudeep
>
> [2] https://developer.arm.com/documentation/100442/0200/

