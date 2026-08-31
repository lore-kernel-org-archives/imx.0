Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD23D4107
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788166329; cv=none; b=jszlfs2Oy5NA4kz1OtkAwQxhAE4vlrL8+m5Q++MF+RtCrD+EUs/Ww7KuLoydPVp1IEOQUG4QZHUpSyQqGkJvQcaESdDFNdI+Ua/b9iH1sEABq+DaZpNq3tnGRx+BVWInk/GC3mBko/S5nY4SySzTszZpLmKx3ssxrrmu6Xhezzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788166329; c=relaxed/simple;
	bh=+2hOgK8tLcdWYDNwQNgvsfIaBdx8Bs2buQwhXdccyfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kmUSIaMyl6bB8cOKvY559xeR+CSbSgH6tYOT/caYE0HVOixMJnP77MiZJ5m3pTmqdo0j9J9jXVVar04s6TI87mONRjnbovGfCtxmnZ+BUQdObeo0kymtoN/tG5cFxy3wrPSlTWPSWqCVw6effoKpUEkWkin4mhto9xr1WXha7iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cb9qiPO1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JiMwSHDg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cb9qiPO1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JiMwSHDg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xNeD4081787
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 08:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	palpmFZZO8X/xAXI6fll/8vpW1RA6tZdCLOM/AIPfzE=; b=Cb9qiPO1ic/fp51i
	A9Y2ZhtgOkhSln+gHhILBIxKRU9q+EFTQfIhJ4xKf3wSbJzN0zhWjc1wjKvCjW/J
	20tRmMpCyW+/6NVKa9ju+y4z34Z1xhpfyAlboEeTtuW95Rucj6k1F4i1tL719VRR
	H7wYpvc/yeIs2lWB1lSE8pg+CBO0IWoWkT6ey/hVX/H+KRECt+7Fqi+odS+2dl0A
	qFhZoqADFb0HvLuYkRm1kwuOOxblBsRmGTx5jITenBO5AvipKEk6e0kwpMD4rdQU
	pwUrlCvklDqEPsTAtZqr77iOoDzCBPICWFBDq/2a/PhbXYlmLsDkqzi2JheDwFRQ
	RC/M7Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1tdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 08:52:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so1231914a91.0
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788166326; x=1788771126; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=palpmFZZO8X/xAXI6fll/8vpW1RA6tZdCLOM/AIPfzE=;
        b=JiMwSHDglhSFJH1h0CG/aTkdppcrK5wHYC2iycTM3aURQTC8Lk90gsr45iHMyo+uTM
         GAVwr6Vnkmp1ihRdSjO8+s/hpBs03PElw3jwJLlj2eey766LugKTMyGrFDk2KxEknq8s
         ss4DSlaJijE+XrPUNlyTwF+jKOD+AoQkjT6or7RSu45Knignza0wqwL894t/EcrNULr2
         TIbR2pEk8UUVgwL1TxxJVY59J2s637rQxMg393Nr4qSEYJfchjnE7xRMLz9rPg6YChyG
         c1B1cOF5WMQFC8aEmaNIs+lWG13GoOlRfrAcVagsx5VnGmke4SA58zDZMYLxBpY6jUhM
         w/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166326; x=1788771126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=palpmFZZO8X/xAXI6fll/8vpW1RA6tZdCLOM/AIPfzE=;
        b=JPGjDvAfv2GhWgDPyhS1mNBOZom3wNZsRl8pOg6EuTFeHr0NXa60SYonC+FZifg3Ga
         cKkrtAfsR/LNs4XO5p5V8KQo429iazWCwmDP9qvvWV4flkael6tcX78dFmdth+RR5rq3
         r51Ai/wW7XKofYIlrmxwoGpbMopOCBY1EUxkv37s3yKH7Wdjhnh3eQCsrBPIGLIYO2/l
         2GXDpdg5gOtFI/MaGXKbaOC6A3+yFxs2n89GaC4kr43JWIC2vFGh3YKLlCONvtubcWk9
         z3M9KZtCIUx90ZJGLQ4VbDEu7MV6AMoaJgbuVHzCuWjBc2w2vv++hB7/uMP2w6jVqNwB
         aXPw==
X-Forwarded-Encrypted: i=1; AKwUvBx/Why7OmVXTFqau0qQdnHLkktHsWWu9+rvReL77Lp3aTi+jMpF5t+fvkIp6q45t6IYk0k=@lists.linux.dev
X-Gm-Message-State: AFuF++ntX9Rtj0KHCedD78/fKE1ucFvmqAfmP8Gt+NzzMnQS9gxgGeHZ
	dc1rjqVtGGt6DWYrD8c7fZ4w1YyLqUBEutCcez0uZUvRLyIOs7b1LbuCZvfLmcv65zOuDtAfKg/
	Bs2nXPBc9tRFjEke9lyIAPAI0Z9FEJ0faynRh5Yo6a90D7q6k9VS8y44=
X-Gm-Gg: AYBFou0w2nVXJx5lzMETjRkYRpA8kxX/7eETUokktpdtJ3MRZMgurJ5dRwM2OqhPgYd
	IFeBnnPuFtinvTs05ozMl2snHuHOY+xmswgYshPmalJGo8W6r5VmFNSUlnlnc0TcDNjZfDU1VVD
	Fxrcp96Z5MqZb9kLn+VwKluZgPtfGxctXJaJW+INTmj8ZSiMJrtpTM+yq5YsVRsRa+YjPubfgI5
	U4oERJoO8yEa0DEqDrQO3VCbsM3LCo1l15t73iZCZ0rmMc3dxtQrh8fxMBbB4cWAL5s2piYqu/Q
	r2tptMXs85c7oSoF5zxiMJu3TmcHs0V0vkkIYbn3U6PgZbb5cbYemiR/H4aaNZJ5rAE61VpZOM3
	Cv1TXlh7heKS4frfn4yoRnORYgZD2W1wECA==
X-Received: by 2002:a17:90b:4c45:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-398ceed6d9dmr12393505a91.25.1788166326211;
        Mon, 31 Aug 2026 01:52:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4c45:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-398ceed6d9dmr12393440a91.25.1788166325630;
        Mon, 31 Aug 2026 01:52:05 -0700 (PDT)
Received: from [10.217.218.20] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm46282736c88.14.2026.08.31.01.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:52:05 -0700 (PDT)
Message-ID: <8ec899c7-61a9-45cc-b332-a98d2c0ac344@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:21:56 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: qcom-geni: release DMA channels on probe error
To: Shengzhuo Wei <me@cherr.cc>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Wolfram Sang <wsa@kernel.org>,
        Ludovic Desroches <ludovic.desroches@atmel.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yao Yuan <yao.yuan@freescale.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
 <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a9540b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FqpsaMCCsM1CaQCKzz8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfX3Lq2jLV9dbs7
 TPg8enUJhS/EGmFsDzwlWLTKI1EToobSm/DNF9gdUbFd/HjDickVSzss70Lr56HUydry1Z3ZPAI
 Zivvtf1jP7it/XXceJ/dY4h7V/lnVyo7QTyBDQ3S7XtBhdmlgKN648lA7Si0E0hUPgtXP51PRkT
 0nXme99vJG9VndlgdRiVqXBJP2NWWVjBtVPPCUU9JvPAIAPuGLeFqWMzv6xPU4+YGeWzFTOCTv1
 j8WsYD5UqLZ0c+ufS8yltKUOvPiOjhscW80kKi9J8SdQaM7zDb89Cn9CANcj3avpRXlAgS1i89V
 qidAVId3gfDwPaVYuQPMndUAjf8JrwLx87TFb2AK0ZtqS4MXnqqcaHf1bfejYNac7uRWmexhne4
 usZrJHsDz5idVZuPnCNSy3zRdr49FOnldoYao/hj+oGLfFgqPbYDvt+nJWGbFeNhmEAIEU2z0d4
 i1XUBH+2516cQH6PoAg==
X-Proofpoint-ORIG-GUID: QYm059wM9UWAzJ_kTneQc7basLO9Vt7_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3NSBTYWx0ZWRfXyUYJZs69Sm3d
 DQwO5zjlc3cmlww6P5qURXfpDuR3yvF2xO+s/q3YNYZPa9bZqpc3I0VF6oVFFlCRPpVfDu/JhBO
 Q3H1fDtKN8ve6vh29LVpVRhOPaetwUs=
X-Proofpoint-GUID: QYm059wM9UWAzJ_kTneQc7basLO9Vt7_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310075



On 8/27/2026 9:13 PM, Shengzhuo Wei wrote:
> geni_i2c_init() grabs exclusive GPI tx/rx DMA channels when the serial
> engine runs in GPI mode. If i2c_add_adapter() subsequently fails, probe
> returns without releasing the channels, because the remove callback is
> not invoked after a failed probe.
> 
> The adapter-registration failure path used to release the channels via
> its err_dma label; that release was dropped when the probe tail was
> restructured into geni_i2c_init().
> 
> Release the channels on the adapter-registration failure path, mirroring
> geni_i2c_remove().
> 
> Fixes: d8d3bb127ad1 ("i2c: qcom-geni: Isolate serial engine setup")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> Assisted-by: GLM:5.3
> ---

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
