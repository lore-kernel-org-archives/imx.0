Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793696137;
	b=UYd+kC+YzA1zz/mjQKhU6/pPByL0QCbCqqaRE8eJ+aL/nnPjl7cpEhwHdExrC+XH0of2
	 X+abCUGWnKl65QHowPGOPrFOZH/NELuyyy5SF4rsg9bUC9cHchG1pS9AVU8w4Efc0Exsl
	 nzbK2MHu5WVtm9eQBLXokgFO4kunbu6HYktvMgg+u0hEQr7rzOnE2DQ3Cqk4EuB6wv5UL
	 tQ/x1ki/MwZil5tywZf/lLQa0qegQOGozps/1HjTbfC7AqLLX1Nadt6GRrDJpbx72s3Or
	 tzPux7lKs765TGJUjEzCezqCDiNLxNR/EJDXMxWmS/wfntMkd4HH5cpGD9dbP2Ic2Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
	b=YOHdGNhciub8++fVQw9j71w6ZDnIuLJhWJdYFkG6L+FP+bGQzdKoqSWulyolga42Trdm
	 BTRcCubsGzx+fCCWFJpAPa3G1FvR5L+/T7Tc5B9PPPYOC1FPx86QdsP97NiNxg5PvkFTt
	 zEulS7rbA27TiCdZY2JoBr/c7Rbszq2kDSAjfkm0kpXl2MgHoCu47i2/3TErjE63+kMe6
	 oSU5ENY2a6RXCXgry+i5qDPEN8Z/1rDVvOTRT+zb+9IaFZ6MAysoGHy1N31mrlsnAyEbM
	 vOJQmXE3vr+0Jd2jIN/j+TZOvuSRZkPg+A91bWhIbF7PD/ZQbT4g3aXcptTRYszeAhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWmJBZ9g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DjiSXVS2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEA9606A335
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 08:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DEA9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OWmJBZ9g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DjiSXVS2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A389at54002666
	for <imx@lists.linux.dev>; Tue, 3 Nov 2026 08:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=; b=OWmJBZ9gc8nkZerz
	b1HG3TUo8MIzBBrnc4dE088yesRqksaRibt7o2ejR7EMPKLM7Sd+wr+prPDIZVwl
	Pv49uXdDmq2HLJMXKLwIKsL+mhOo8lJkCv4lGoLBRzEmzEeUP581zuX9q0KUlZD2
	zo+oKNv1sqaLORWJq1VbGjXIHmE0UTS4R5/AsES2rA4KftwMi6NcmdQUyurgGFaA
	2S8lf/Gz0dBh9bpxXBZbI/0Z+PTYEbDOvuEeu0QNPDDmxmfyp6lVSyXRCQd6+QMi
	cYe5cxo52UItq7Yv/2hPxg3PiCga9BvqtFeDnqs7EUGIkRbi6O9tX/WQvKQYPeS5
	CNW8/g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ejuwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 03 Nov 2026 08:55:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c70349f65so82332036d6.3
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 00:55:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793696134; cv=none;
        d=google.com; s=arc-20260327;
        b=mP9zHZcgZkJ+/OLHw8KSMGcgUKuih6vfScn9zoHFXDQK2uqhIUClkcVJeBxBw1HM1R
         ruxa2xwjH0ixYIK2CHAFGx32wkcCctjw1+bJT97Mx8HQWi6eYMC6i+eUC68kiWVeq0N5
         eQyDCEfuFI0E4yT9mpzGCrI2ZrOPio5Y4C4KFg18YLtEq7Bva+/9bM735/T70rDXoxP1
         zwnTMaT6T33MbbnnuAJu3bwXS/FcTXgLjVYU1ly+7wbeftsioWPIQExtMjDdqbmrY+G8
         PNMOXaV9pxEmGp2iswDgKXjPhjPfX7o9vQr4vsf8U8xq2pfoxGryUyEF8ws0+Yka8kyf
         9mZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        fh=AEmVaEnwAuiG5MGZQxSI9iyetjBf/F42yuSXWhuabSI=;
        b=FQsM9IBzCgwiayUXxTGhI7rUmJ3S+zY2PmPn9DU2PGin1MDre4nvpMeC1FiCN//pwi
         QMuwIk5pz4hiFAKPZT3W8aaGrcie7+9Jb6g9GM5HQ9PinKXnOoSZrZRTMwtqoYSKPP9f
         xjVvd04/v/12uvvUAx5QBFlzAXprWTHZduho9LzPeUp8yDIc5DCgBqRzVboNSRYwx4qy
         b+xWNc7hT4JmIGuDRiUsjejHlP50Y58/f5K0fe4SDkbkKax4BR+XwXmwvlEUZPV5V77x
         O8wsx9qz9pje/EE5e9wS6QOkS/LRtFIxK0NG3H8rT8ux4RizPx1ARvbl1HIC7Em6uuag
         PDAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793696134; x=1794300934; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        b=DjiSXVS2Ozb8vqxq4+SYMsEOVnQZKRaT6hrVVfXnDoI4lcXwCNgT+cvrc+bfostZJf
         j+g8Cxz1ik+d+BvwJM7iCbJndRZCgq9tJqR449QRnpV9gMWIiFTxyBEffKLNBLUeyxGV
         INr1U+DwWP6O2oeEd6m8ir4J4G71WnH0Vs/QF16BOtebUSHJjmYf9pfzIg97iST/1y+r
         pTGsU4ju/nGCygxNRnPrxvK9AdvFO8fwA4FrMggCzRATOZhQeMjk8K9J2A7C4Rm8zG0i
         Zj0+QwMjCopvOO5RYmlYurBRZl7dXLk/2PLrK5jVJ7L03pFs2ePmTiTYMop/7uFKc3ph
         QB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696134; x=1794300934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbsOpFiwDX2dELfvfvGwSVoz/OIQAceMk9d+tt4Lk5I=;
        b=Q/gCsmTQV2AiKMLEKjTGXoVoZz057SNpLrJxu6M5R90CVA6xWwlZP6P4W7Lr8/jn44
         91XddlZIYCOoYnZQ0M1N07azxD/jJxV9FFftbhkfFYMu8WyB+m04xbEXvYlbKyvuUpm1
         GGd3+g3rqRzKR4lv+zeOw86IvkEx0Q7zDc1Am7t0zgjaXXgW/sVLRWzQ+HsY+RgirY9t
         dI3uKmVMeaEb/bmBqwsDRJ6nR4BXx9C3YSAodS9EavAlkB2Z2awH0h1XV5kTWdv6LVsq
         b4l00i98MtaJg5GFyxsnHX3UITnCpPPNGiEXr2TxOM2g2vhFvJSKL8exaYi5p6tl7oSo
         mmMA==
X-Forwarded-Encrypted: i=1; AKwUvByvsthgFdA+jPwCRVRZ9Y/b+emYik+7HUajA8m/qKL7gjJCS0urU/ejzMU+UrNtAiUlp3E=@lists.linux.dev
X-Gm-Message-State: APuU4Z/ZNG37zXYwgrdS++xWw6rQbWeQlu8rK66IT2Z8phc8f5MGG9Cd
	iVvC4XeLZ7WlHsg/ycKOPyLqQn5W+m1W1LkOrGk1BzJOzulyJ/Lej3U5QGdG1JbF3xYEj3FeFC4
	ZIYCTdyQbeINvcmb0/vmqzn/zkk4RMcOO2z5SnR40p4+qx1bItbILmFPI+74FGeMIOv4AVWrRzn
	yt6qm/XAS9gQZvbF6rxKav1ymxetCxmQ==
X-Gm-Gg: AYBFou2Vr3G9jBao9RFgkVwBf3Cm/5pdw+PUSlz7kp8RpKmIbBNcf+usYO6FzHdAJxi
	/OQX9wRCl49Pnm8P3NWbwAA1FgWr+66OqHDs8ZKeA5kAP4Ciiqn9WvGNw6Zdhlss5o3lCt4TPgU
	Q4OTFRKGfzYcEhtaNk5um6xlawPRWPKZ1xBa2+fdtkTkgDW5onGKgzHiA9Wb5+3dzNz6xBLTwVy
	TfbnhVBttZNCnLkMpGjIG4+rj3AUYCu+mDHljbUctw3WcZq4NjxgP/4ySEptsnT7vY+OXAE79Q=
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr2157957585a.28.1793696134232;
        Tue, 03 Nov 2026 00:55:34 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id
 af79cd13be357-944216b1af2mr2157954685a.28.1793696133721; Tue, 03 Nov 2026
 00:55:33 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:55:22 +0100
X-Gm-Features: AclHuK8MJq-s56wdtunEmLoEql-aTRrOrw2wQVU5g0yE5nW0xqWZNoiPrAFZCeY
Message-ID: <CAFEp6-0CkkoT_xP+zvJ-ffVQnn2E-9AuiC0=cer-Cm1_s1dZ4A@mail.gmail.com>
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>, Frank Li <Frank.Li@nxp.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Li Youhong <liyouhong@kylinos.cn>, Joe Damato <joe@dama.to>,
        Arnd Bergmann <arnd@arndb.de>, bui duc phuc <phucduc.bui@gmail.com>,
        Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
        "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        imx@lists.linux.dev, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX5POIdcyyyaZD
 DsPXqg8TDlpTYvjcFlxJd4n99btkgFNPNVcWhLYM0QaHfd3TtG4ERHfnqoOpKzEWxUZoD09M7td
 O0E48+sfJvwTDdRDa3y4LdidKe8RbOysixFXZpBLECygNaQ0+KPv/ga9vU/5CHpRjHUTo2dqLY8
 ZQn7tPWMFqf/Fc6NewmOmzgwmTV7UOILlnTYduTkhxL4PYMXQWV+STnvSTJymgClnSo0JDzVkYX
 dwpLHl6+rpXPaerrXCNDnh7izBkDbrHEAe0285ityrT71zB7Py9AQJqtqo2qRYlmNnh/Ghu1XWY
 iqt38fAkkkJDViS98A++dj0WSayk3Be2oXFS601sV/NVi6wbSLaSoO9hxD5wMi01RmF0IbZm+BK
 zkfbKd3JTPWMpWRX1o5fExINFXD1EP+eDlYiC9RbU9iBW09G68zYYO3Ip6lUvs1mW/AaZtTFsB8
 Zhigk3z/NZnaH4FL3mQ==
X-Proofpoint-ORIG-GUID: rWdp25YQdZ1dbXFQ1tfYW4gUG1CUiSLX
X-Proofpoint-GUID: rWdp25YQdZ1dbXFQ1tfYW4gUG1CUiSLX
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9a187 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=OV43vvX7PjCfZyRFssgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX4rhIou2uGiez
 +QdXFJ+exe+K4y47iTHJeHMBHxhGrHfElOdn/REk1V1vq00SN4blotIUTbAAO9fOUWcrWHPL8AG
 hoZgkHZzaD4C2q55dxC/wbFOpY9wRWo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1011
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030035

On Mon, Nov 2, 2026 at 8:19=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across net drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
>  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
>  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
>  4 files changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/et=
hernet/allwinner/sun4i-emac.c
> index 09b2abdfc9e84..d7ee42b2c1976 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -303,8 +303,7 @@ static int emac_dma_inblk_32bit(struct emac_board_inf=
o *db,
>                 goto prepare_err;
>         }
>
> -       desc->callback_param =3D req;
> -       desc->callback =3D emac_dma_done_callback;
> +       dmaengine_desc_set_callback(desc, emac_dma_done_callback, NULL, r=
eq);
>
>         cookie =3D dmaengine_submit(desc);
>         ret =3D dma_submit_error(cookie);
> diff --git a/drivers/net/ethernet/micrel/ks8842.c b/drivers/net/ethernet/=
micrel/ks8842.c
> index f0d6bfc6025ca..c68abd4643e72 100644
> --- a/drivers/net/ethernet/micrel/ks8842.c
> +++ b/drivers/net/ethernet/micrel/ks8842.c
> @@ -453,8 +453,7 @@ static int ks8842_tx_frame_dma(struct sk_buff *skb, s=
truct net_device *netdev)
>         if (!ctl->adesc)
>                 return NETDEV_TX_BUSY;
>
> -       ctl->adesc->callback_param =3D netdev;
> -       ctl->adesc->callback =3D ks8842_dma_tx_cb;
> +       dmaengine_desc_set_callback(ctl->adesc, ks8842_dma_tx_cb, NULL, n=
etdev);
>         dmaengine_submit(ctl->adesc);
>
>         netdev->stats.tx_bytes +=3D skb->len;
> @@ -567,8 +566,7 @@ static int __ks8842_start_new_rx_dma(struct net_devic=
e *netdev)
>                         goto out;
>                 }
>
> -               ctl->adesc->callback_param =3D netdev;
> -               ctl->adesc->callback =3D ks8842_dma_rx_cb;
> +               dmaengine_desc_set_callback(ctl->adesc, ks8842_dma_rx_cb,=
 NULL, netdev);
>                 dmaengine_submit(ctl->adesc);
>         } else {
>                 err =3D -ENOMEM;
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 8a50cad1c104f..7e83c4b5f1931 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1014,8 +1014,7 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, s=
truct net_device *ndev)
>
>         skbuf_dma->skb =3D skb;
>         skbuf_dma->sg_len =3D sg_len;
> -       dma_tx_desc->callback_param =3D lp;
> -       dma_tx_desc->callback_result =3D axienet_dma_tx_cb;
> +       dmaengine_desc_set_callback(dma_tx_desc, NULL, axienet_dma_tx_cb,=
 lp);
>         /* Claim the ring slot only after the steps above that can fail. =
 The
>          * completion callback can't run before dmaengine_submit().
>          */
> @@ -1565,8 +1564,7 @@ static void axienet_rx_submit_desc(struct net_devic=
e *ndev)
>         skbuf_dma->skb =3D skb;
>         skbuf_dma->dma_address =3D sg_dma_address(skbuf_dma->sgl);
>         skbuf_dma->desc =3D dma_rx_desc;
> -       dma_rx_desc->callback_param =3D lp;
> -       dma_rx_desc->callback_result =3D axienet_dma_rx_cb;
> +       dmaengine_desc_set_callback(dma_rx_desc, NULL, axienet_dma_rx_cb,=
 lp);
>         lp->rx_ring_head++;
>         dmaengine_submit(dma_rx_desc);
>
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371..1479f8362e04e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmu=
x_skb_dma *skb_dma)
>                 return false;
>         }
>
> -       desc->callback =3D bam_dmux_tx_callback;
> -       desc->callback_param =3D skb_dma;
> -       desc->cookie =3D dmaengine_submit(desc);
> +       dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb=
_dma);
> +       dmaengine_submit(desc);
>         return true;
>  }
>
> @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmu=
x_skb_dma *skb_dma)
>                 return false;
>         }
>
> -       desc->callback =3D bam_dmux_rx_callback;
> -       desc->callback_param =3D skb_dma;
> -       desc->cookie =3D dmaengine_submit(desc);
> +       dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb=
_dma);
> +       dmaengine_submit(desc);
>         return true;
>  }
>
> --
> 2.43.0
>
