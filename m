Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E37560AC8
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 16:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995779; cv=none; b=oTJ+wW1D6tif8DaPEd7l/MESX/mHQij5mZ91UWsz9O+pHXmlOPdOI1bjB5Xla3/QVZmDKGStb2c+iZmSHDzVv/Nh5c9zahzFy9lkQKsyLbF1BXOqCgpwky7kovLaLUGrTewSbS5/eETAKsb9VwC15wKsKN/c3+Oqg4QYwQ1X4TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995779; c=relaxed/simple;
	bh=PklsOs09Vlf82YwgBbtSpUmzn87NUh90iD+8UJYGK3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMjLfDRsTZ8pBGOSw2UZ18hzwGOmHA+VnGaVRJAPhemTXooFueI7E/4WD48b9g3BOGPFdIKz+qEDup01pvr443uslnKv2gF8GPivBNfz6g1nFSbZNjQ9/iW0gWWAhKfJDd6OorVaZFfatAVtBvU3W3EGeSxksqQTWxXpxjcL/3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTMjNEvY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UF08Wnhq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTMjNEvY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UF08Wnhq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EF4DPR4167045
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 16:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qZE4atZVuUnxe4gh8yTrME7HVReQ6qljuMq3IYiqA/Q=; b=NTMjNEvYqdTCrKll
	f6XgOd60FLUu0XdMAj4D7IwL++ZnvVk0xw3E9JzHsXJ5cLwEOOQq3ip4lcEj3Qsz
	FQjLfPpM9zxfgv3zGMEYeSPgpIfndEwxOrtxSneycTU/s2FeHk06HmPPMYTlx3Ma
	VorPWR5d7vtllaxOSeBTeEsBifuxva5XOLjtdg/zpLiQ7g7soCORo+i8zsJMNwgG
	YxXHxU7XBSeSJsREwCIvF6zEhvS6aRW9IHeaoxldVxCCf5PaiaNXBVxwvpYdbwWi
	wKzzxsCyVjL0f6aT2QyitUg1BKR992QBb+EQK4OC9L9HmcVsqp7eFdoRNUTkUea2
	QRN/qA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hac230byf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 16:36:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so83791385a.0
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 09:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995776; x=1792600576; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZE4atZVuUnxe4gh8yTrME7HVReQ6qljuMq3IYiqA/Q=;
        b=UF08Wnhq7hzPfUMY0jt2GMkeV4kwBsHnMLavmGbtwaMM48YZzfL6xF+5ku6t9AGmdn
         QohuVR4hFMJLqNABK9U+nvaMg9BcqK429eQ5vnCcWatMB1+ssjPUR97HjdrVjx9UmUmW
         Qp0oeD1+STlMQvPRkiKMUocDZI2NZmEHrYZmJhh1tMRBGT5JfzFaeC3u884/wY+ZaAnM
         jEVccm04ERwm7gtki0y3cJmIxKTFaXopL3SQITJdyfyPE0FYaa8vPxwijf8oELNW507z
         4AQ44kbED7khX7sLDRh90u3B+EYe4FnPoHhRkpDhy3aOcLCO4saw7NjGZqctH/6fwhxQ
         7Yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995776; x=1792600576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZE4atZVuUnxe4gh8yTrME7HVReQ6qljuMq3IYiqA/Q=;
        b=ifCzNfNKHKKtsLY1KSiqwkC7yDYGaQ+fM5atdv+VXOFvMJg6EdmQfMtp4x7dkkH8Oq
         7EZzOTiY+5dghPYZYBk+1WbPtf/SOpv9/dIa/V6aLw+HncvI194GA7Xr480UUngIO/cx
         Fp3UC2HNXHhZYUsz8WeOMpgmSputm99X+pYy2//j3R2eCQEJ4uxJNlcCvdbs5F2sv3az
         9/3PntF0HLoh1RLZ9JrNdwVS45/1MBliMvo/FxRgh1bdznXqM0BHZDI5dx1OtcuWaRFJ
         j9ldkMRqYu+/tpoM1ppdA1yI1Tf/5ytYNP0i9r54MZwI9GyFe3kB/EN5qwgBxi9R8YGl
         4ThQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLzGQJ2NgXVk2pg7FVWU9LcDc6G4H4rmGKRCXLfAUhCOL8CNk/pTWEuZhINAoxgRQvqK8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJA7kSvxzxygBtg32pVqf/tUdzD46nehpxfh7nGypFzpI+/rrSY
	4QtEJpeFP5nUBF1ZT2i8j/P4Syp4Xn/ammwBb6XeduAtjSSwzm0mlYWXW7Da0ty77NOWefr4qj1
	7fsc//EVeEXf762Ot6vkxMBIa19OuKxkHh5WftL+F7BRUAO3VwcptJT8=
X-Gm-Gg: AYBFou2vzBxQmRaeKP4yt8C+XDW+yZw//H170wxz9yuqFlX8xQ8muC/s5bFUREVl5iS
	EMvK78G28qNHh6utFLqqyi3x75tkuSz5Hzv8KJ/WUn2H6HC1YLDPYHfW/TCpp6tETmb59H59r/W
	LOu7GysvrnDJbOmFObMEdOV7wa6XY6SUa3+OTzBY7VWpl48zvWO4LnGPuWhy2MP1thN+d8yYJDI
	oIWsGZ1uBSjl/XcQrhChMAsBSVVAEKBA9GO5U+8K1ACqw3NIjy8TNKAIdHGZ1Wt8p0hfPBSRcEu
	2JqbZJdg4SMAnFpQtRhM5pBQ7NFdIq4r1/4mn4Zq2kuzt1tCaYVMmNmUBatkQ/53mG0xFaw1ck8
	Uromxc36GCZeQmFsH8CNYtQ==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3128575585a.2.1791995776342;
        Wed, 14 Oct 2026 09:36:16 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3128568885a.2.1791995775873;
        Wed, 14 Oct 2026 09:36:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20386327csm1289977a12.18.2026.10.14.09.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:36:14 -0700 (PDT)
Message-ID: <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:36:06 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai
 <billy_tsai@aspeedtech.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Peter Griffin
 <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        Minda Chen <minda.chen@starfivetech.com>,
        Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Wei Yang <yangwei1@eswincomputing.com>,
        Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
        Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
        Yang Xiwen <forbidden405@foxmail.com>,
        Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
        Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanley Chang <stanley_chang@realtek.com>,
        Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
        imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6acfaf81 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=auHUQpDKApYGa_LtnhgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfXw5ee8gGXISc3
 maHcdZC80G4Yq3KGlTOfomgbEj2vxnH187Sco24QYf4WOBxrnNuA7DY0/0DwkCzbEb293+LNQ/n
 xmt3Gc3SEPRqps7NbFG7KU8P8bPxmqI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX2kjG8B0e72JK
 QbfyGnwzVLNtjF6A7Hjz0HAkmKa/bqLtcetHHqZaM/5s0P/6PW02R+7d1G2oNdsAL6qn+H3YtGK
 tLuyBZrtupt3OWdT8shxkgFjFkAtxCjjO1ICZcTAH1Vtw1qCljUAVCeshiIEVOmzByYoG0d+wfC
 PzH4eAuLHGPHjF8M6l4iK2NL1eDmbw4UMOLCvMvd3ZbBMHIzprCbDq6G8YyyxShfMBOZCcN+v1K
 dNDyYyUkWtX2Tpzs1scoQqCdpHSQvvNnQP+C0g8pR12qvaJtYmAhiEJA2Ncwd9puDaf8VF0AAx1
 jtWvW8zK2+5Q9Fr5l/8SOqdE9cuFs9v2xE3uRpDU4oOXmBR7Zjl9IOEzE/pDXvXT80enikeoVRK
 ho70FS+A3gwx+RT+Pgbgw+VitT2it4eD55n+zrDY6gB/NnefCwKm6mPV2HvpZF3hBHUvp3u3jKo
 c1+9TnmswBbhIYuyYeQ==
X-Proofpoint-GUID: pMmGslj8SGI7a3tGIQ0sMP8BkBny37XW
X-Proofpoint-ORIG-GUID: pMmGslj8SGI7a3tGIQ0sMP8BkBny37XW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140066

On 10/14/26 11:44 AM, Neil Armstrong wrote:
> On 10/14/26 11:29, Chen-Yu Tsai wrote:
>> On Wed, Oct 14, 2026 at 5:28 PM Neil Armstrong
>> <neil.armstrong@linaro.org> wrote:
>>>
>>> On 10/14/26 10:20, Chen-Yu Tsai wrote:
>>>> The DWC3 controller can operate in host mode. It does so with a XHCI
>>>> compliant host controller. The XHCI has two downstream ports, one for
>>>> HS and one for SS. USB downstream ports start from 1, not 0.

[...]


>> IMHO having consistent numbering across controller types would be
>> better. This avoids making the USB core and hub code deal with more
>> exceptions, and also easier to understand and write device trees.
> 
> I was in the impression the port number not necessarily reflects
> an actual physical numbering, and can be a logical number we would
> then map in the kernel.
> 
> I don't see any issue here having base 0 for the bindings and then
> converting it to base 1 for the XHCI port numbering.

I thought base1 comes from the USB spec and not just XHCI?

Konrad
