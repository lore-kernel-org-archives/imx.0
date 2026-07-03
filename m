Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43BE3B47CC
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073605; cv=none; b=JVwaVo3MIcPPV3jlqG7mI8ml5ykr/HlPd23Cl8F3ZTwOVM1yZZwxY+cIbt48JcPC0eV689NNEesuLswBJvqliwwA26D7N98eapv9+SPgWV7ZYH72uZHL1V+vs8wA7ey7gEJiW1kFlsUHC+KlLo3PJWPUINmfMttfgq0u13OEC5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073605; c=relaxed/simple;
	bh=g6NO/hgtUlkK66EiSlUQVymWJtmwBVpJQ3HhUlxuYQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zwvn35uGqAYD6ti0m0m5TzE6ksfHNCmwYgAOq/3WlB7cCC2ZdJsMgXZQEZ+Y2O/AvxPbRdYZ496OOunt9f2ztB/Bir+xE7DNpqmlvHVSLcWUb2cBjnkXQp5NKX+LO/+KHffcdrzIM26lY6jD5i9gtVyDCicd9iivdjsMcTr/ydE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqgTkWJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LO5nkVdT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqgTkWJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LO5nkVdT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rkYE3123514
	for <imx@lists.linux.dev>; Fri, 3 Jul 2026 10:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=; b=dqgTkWJ6AwlZAOOG
	TZJpLI93qT8q5TY9jfKapyiPNDC9hTYfBrkRhQfXHKwLBwG2xzEy/g1PYCJBcaUU
	CTJYs9XdM10N1GTv0P4KQnQNQoOdn5DVhLhrTSUVE03KWI9HQEgv4/Jv6jOVsiyY
	4c1b2PrtQ9oMKYL/tAlxRh6TcM94/lIi+GmwRMAsIiH5dwgA/CK3fkX5PbnZTw0b
	OBpxzzyj5fCK8w7NNtHeRjrO/9tTtK1oC9IZdWvprYULOQOdVLu0aXf5uHpMdJuv
	9iTAKxyFVHLl0aDagEWjv/nIz/7L+TqQPjLRV8ArqCu6K537da52zC9trXoYOpYy
	To389A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpctfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 03 Jul 2026 10:13:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so1109666d6.3
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073601; x=1783678401; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=;
        b=LO5nkVdTDgAY3mFcfchVB9Rf/dEj3NQ7habA1TpPK8mozF/mO0L6Vq8DdZmGIAMxb+
         ZNZCfq3KIO/uC2+OtglxpoYvbE2/55x1aBsKmiHNNIxfYvicakldW5/jPG7m7iKP60Y6
         AcJGxizb3GaJ4lYyaRDViH6xiedBKwKZ5B669UXpLygOH6iiP0Ifo+1o9xsHQPdGEBM5
         ZSmCJ1k+BdD2aebx5UOArWOwIDjfm7vcubnnuRlDaoJpgd/RBNFF2B/b2nT2sKEml6Tp
         Y3BDBTsVdQ6fceFfffby51lBGR04kFuO3Wjz+0mpbyn/aW6KZ3+SlRde9elslS7IDOAk
         Ji/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073601; x=1783678401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6csOGuNQZW/8zcTpE9Z1FJS10bTlappWn1DYBCQO9LM=;
        b=bfhS0wI2UA1u5NY3Zet4Bdr4kxyL55z6kRXWdbt1vHzeLBToKTQuOMA7TObMD77b+t
         +5UJBarXQijMAj8IJBavsjlRYY+dlzNabApAZ7fPQiYq8QtFYXkTmkipT5HBQpjmcgtP
         IJtoqpBmYkJlYMrxDOOvUztGcifW6EUDDtJTz1LSyUbAdZjofueQCjUt0yVrq4QoDCG5
         f28mVmKeYn10ghDdyJLeRfHpATEVw3IumIVHwFujYD6KnpJkApWnXjKEYImjw9NZS9NS
         ANAQz7CFl16lpY0ODSC/TungKZCbzEynnTkoPL5EAa43AwkLIBbLAsd/EhmfUNNrhmnc
         aolA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+gxlcXu8aBZJqJjXiyztTdqCsUOTAwbHPXQBVBRsIQWGQpiTLfFfz8n01skbSAGz5F5U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAViiLD4B8VLVIjboaHlptjV1i/4rZzF6AO0nFgLEM+f7HeXTF
	o4zx8csa6u3+IHnFfvvFomed/MOLSfpJ2cF3V64FIlgYnirIjgjjCAxa1AOjj+gnsHMbs2ZY12C
	l8PL3adnX/9c+Z2ze7tknwTvJAasMbxEo2Ta2qOTlF7RSTPFVXpy+Gcw=
X-Gm-Gg: AfdE7ckHjRrEirOt0lFInFVfPT2dsFVLXqIyl7U5+aiivdJ4R+jGr+m4VGkknSWcu08
	LKAsdlRKRdb0x+OnuhAgi2xojLq33Qix1Mvywn6w/KPYEodnwuhX4UCOfJCKRCM5Qn6dJdnWGjM
	6f7qIKQHC93KHdVThhJdfUbnfyflEFb8FAnVnapgVCCA+OR2T4FUJqH1TPZNmd4xR0ulwQFPWGj
	cuV0ojncAMqXAU3B2D3eGZI8E3jPfHOlEJfkGlI41GL1wnYvLJVQafh3cMRue8XB6b0kDwJh5V8
	njghC5sfV2SgAU368lgD9nmyO+29yHmDUWxyGBhziXhvBSdnQSnHgUMovVBYjHgnDU3exC8zuT2
	fC0Hh4u+oiazEWxOTf3EjJ583ZJIHjZ9P65w=
X-Received: by 2002:a05:6214:cc8:b0:8ed:a980:6b27 with SMTP id 6a1803df08f44-8f3c854777cmr86121546d6.8.1783073601174;
        Fri, 03 Jul 2026 03:13:21 -0700 (PDT)
X-Received: by 2002:a05:6214:cc8:b0:8ed:a980:6b27 with SMTP id 6a1803df08f44-8f3c854777cmr86120726d6.8.1783073600643;
        Fri, 03 Jul 2026 03:13:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad119406sm2158642a12.21.2026.07.03.03.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:13:19 -0700 (PDT)
Message-ID: <827c4b64-1881-4630-bb08-f9e2d97cd32e@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:13:13 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman>
 <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
 <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5OCBTYWx0ZWRfX5EtWS9qPAXeg
 pr4sQsGubp7qQl5gUHlWBDEu9Z85zK7xfulecP57e7BpIY8lIpV8qbMOhEsjANWtRy6NucM3Amw
 TYOekhF5vgSjRFLKGtgNusKILBeSRaU=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a478b41 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=lwt6xitBv4dyHUtHhEkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5OCBTYWx0ZWRfX/9jAsAft1L3w
 9+Z4uuX5yHxVrZYsNulZDEYDrcZcD968la+WRGIjn3clfoWZWA3rWeL8rld2ew9wTdMDUuA/Vs0
 +xHbnUTBSIrS9i1rvrPUneC2w52SXsYgpCjO7n6zJr6ZkuXHDtr4kuvaCQ9HR1XwMwUR0Cio7Sx
 SUgi2AiJAjMwz3muWPRl+4g23uO9Q13WsmzTzELAPjXRkAbufp4eL4jPjht8lLqfoqFdidVlweE
 aV4S8hv4wstMM39EG4xgbownvVGAGmQrq3o928E5oxdOHxL8p524jDSLpd5PBh6CEwHTbgZinax
 2ZgrmGDnyQNQnkP6tWE0ap9z96+4rnidKSau41VrFWKz9PbA9uVfyXrOiP6ukxURWAh01Z2DSV8
 tu5b6qcW+IlemKmb/gYPAEuyeieI3Bezr1b3qZp5e51aUP/2ecOO5+hIczCbXw+nnKYcAVyBxue
 kv1ysgUxDehuzACASgg==
X-Proofpoint-ORIG-GUID: W6JKpS_ghQwzq0V_QhK0AIIoFGKhhG_E
X-Proofpoint-GUID: W6JKpS_ghQwzq0V_QhK0AIIoFGKhhG_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030098

On 7/2/26 11:16 AM, Geert Uytterhoeven wrote:
> Hi Bartosz,
> 
> On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
>> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
>>> On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>>>>> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>>>>> driver instead of the MAC driver where it was previously. Instead of cramming
>>>>> both HLOS and firmware handling into the same driver, I figured it makes more
>>>>> sense to have a dedicated, cleaner driver as the two share very little code (if
>>>>> any).
>>>>
>>>> I think you are mixing up DT bindings and driver implementation?
>>>
>>> Should the bindings change if we have different driver and firmware
>>> implementations? Isn't binding supposed to be agnostic of
>>> implementations..?
>>
>> I've thought about it some more and I believe this question is philosophical in
>> nature.
>>
>> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
>> the same Lemans Ride board and it becomes one or the other. Yet they are not
>> described by the same DTS and the bindings differ as well. I don't see why we
>> wouldn't allow the same approach for the this PHY.
>>
>> We treat it as different HW variant when it's managed by firmware - just like
>> we do with the rest of the SoC.
> 
> DT describes hardware, not software policy.

DT describes hardware, to the extent that it's accessible by the OS

In this case, lemans-bare-metal and lemans-auto are essentially 2
separate platforms because the way we can interface with the hardware
is so vastly different

Konrad
