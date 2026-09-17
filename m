Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16394F797E
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658910; cv=none; b=b7UqGwLpp4dqht4abkMoaKkj/yW1rAzLc+NYJXscnhEqQzaArCPudf+HWm/HwpnZFB0SpBW976658z0QvuO44BkXHMhNm/dZB3ZaJddBUKr/gQVJNvNEuVv82QOft8Ij9T2ZzluIwUelgaw1hStXoau29SomYoETzI/haFeD0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658910; c=relaxed/simple;
	bh=qwGaYA5J8cQoMsVQMVZn6rsA2VlKVu1tTczIgrpjkX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKVhsJy83++cCvELSokObt91YB486DZJBArXsiMT/nOiTe+wv9Blsvm924JMdexbd0UQNZIj+nATkk4hgzC0GhetfCEPr0Qzos3CFdRNkr6fuc6FoQPX7/micliM06mOSTkuZuBYUGO+FqGwzDfnEA47MvyeJUKO51KziSBfj+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoDptICm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czCNjOlr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoDptICm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czCNjOlr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj62x1175798
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/+Kdrxqgr+DvSDtGHpmdyPJ+
	B7JjcHm1WIvNra5tjA8=; b=SoDptICml04LDj+/Hm62uX9L2Hm9dE6SyQxVys8Q
	k7ktWMgoOV8o+O/EpE8Qp+cXlre8FEjO/SdNH3MwBzXNJGtMoIrI6g+s6U61AQ7T
	37sYmKtsXOOYyf+0vxHw4Zkx/DAXj2rgUksaIzaS8YDdQ1RYSuIz7WDHtg9tOZtp
	uQQBGFuVRb9ybhW9TsaznIgeGGrYljvpNc4FqhDc3R/2u5yOj0kHA8VoZEfelkFn
	aPm+6x/m22buDEGhOAbyBBsu7QHewNMActhvFlBDUN2LjS2ijS0PaB0uKAevdswT
	3p9MyAqJVqWMTrNpTIsXcFnVAALR1pKtR0bo7i2f76CM3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0syc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:28:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so118996685a.2
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658901; x=1790263701; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=;
        b=czCNjOlrnanOv5Epl2IlZ876UC1Mw9AbXiSRRvrIUPiL1QUrEYvhzCjvKlJKb5CEiJ
         4x60kMDTg23XUo4cR+nt+A1QzUsLTRPjctQCknOaA/hVQSKsOa5cM28Pon4d2Zuksjq5
         vJfVkXmOJAuwmnr3CYrq0QsgNwbVaXHBnVxKmn7+6VwZnt74V5kApaoDb81uQzLdUdvE
         DrR71IQTD6iyjq0SbsDs7dJqeA70d4AvRmI43a3fZiUb9en6RLsCLMettJ3sP43jxc4U
         AlCYmXjaXBsknUkyzDv1iiwP/klpEsXa6DqB5QKgq1GTs1K8hVZS2dX8SUrhwIs06iGj
         PzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658901; x=1790263701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=;
        b=P9HIu4O73LB++h5UWvaEQ2a8J16Jcap2KoZjA2JdJtR0ER32JtTqH4KKBUwA1UU6Qo
         6ceg1ccss1HMGedTQDG94iqZ5blaqVPMktknskNpISgeCSa2S/sSvBf00V4n7b2Znh0l
         9nRYXUEdoodGak0DLl5vFHzY5VqGGZ8WpST+uwH2EmZ38EQMqvYomNls7EYeU5KE+LPC
         JCFIdRhYceB4K2kRxEBG4/ML5eD3sV4fFF2uhwaPjGhdSSrhg+OLY6qqLuWSMTMZVDAR
         kUWtgSoAv7QGDvfjqq89GjVZP1zm/f1cegZTCrQKHrO/ErvTCcReB2clsLzwit8Cf56C
         UirA==
X-Forwarded-Encrypted: i=1; AKwUvBwyxYDVYrKQZwjYlwnxtd2H+cTPnxfVaDUj9Y72cDDF/U5Uf+4PDxE4biOE8raih9/H3IE=@lists.linux.dev
X-Gm-Message-State: AFuF++kb5LXFqEVQ6J2twhlW6ENi4eFpuHeKDXSJS6oa+nt2UMk09YF6
	4dReA6SZUmh/kWnEVAegPBeaTUOmeeN1dTRIOjLgeVdnIq1ojfKoyqQ4s+6H3DiuXpM8sIV1UM2
	F1kifSDXgn9R2VP3wx4+8iin+74aMwXDF8pGNNbMd799K0h8+8w/D+bw=
X-Gm-Gg: AYBFou2aKRYeREiEs7qVvT8rAvI3qtPULqgLP0l5iKy1Q7n9lMySn0E8PIGqo41n0kd
	Mz1MHUX++ADAr8MXMUwQERCkqPNKaZxrnj1zrDmyway073HBj6JTJNyR0ICrsb97C+QDOGjrdAp
	KZkbcI/9mab6J67CkBnJO2lYeMSGGuSXrt/KA0lYwQfU7gftpqWLv2dglZsbUE1wau2uxNTaJfY
	aA10G/ki9EQoIZ+EZ7HO1ZjEBt5w2D35IYysKa5o50tqK2KILIDbltwGHmia9/Kv9Zk2WpLkdZe
	jbqgcr/mbH6zwhGPcH0g6h76Sv0/T9bFa5ct/keRjn890C5hFy1shL7c8xiDrD1tdTqHu1Bpcm3
	p/9fHAcSO9icwEtw=
X-Received: by 2002:a05:620a:600b:b0:939:fc74:b6af with SMTP id af79cd13be357-93bb76bb19emr1300811285a.11.1789658900988;
        Thu, 17 Sep 2026 08:28:20 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:939:fc74:b6af with SMTP id af79cd13be357-93bb76bb19emr1300804985a.11.1789658900484;
        Thu, 17 Sep 2026 08:28:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847ecf52sm135817625e9.2.2026.09.17.08.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:28:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:28:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
Message-ID: <o4tjzh6mufahuvhllyxse7p6vvbmbnw4mlqg5zrmgyqa6ated7@m6rmnyse42g4>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VeYR5VD3s4qZJrDzsskUFULk4WUrVk_c
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX08RFNLg3v+1D
 7Sc6C+aijSz5G+JZJqe0K3MX9BHZNbNbXGBOP51Q6BK+Zusu/96hdG4ajXhDDAlQOTTl7m8pAQN
 8OOcm4aV1qsenzOIZ96wgeoX2sa6oEY=
X-Proofpoint-GUID: VeYR5VD3s4qZJrDzsskUFULk4WUrVk_c
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aac0715 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX/AGbo25qmHma
 HCXQNU6s6drAZj3tnnzwyrXMci/JX7MjAw6ZFEIMcl0Uv9arKgHrMQrB16A/cXd/Wn0KJWx0Z0E
 bCS7BsJT/I6dUEfh80Jt232iKUR8AtMwnOoyrq9HpTC9rlUrP6awGMi7PSUMNQf+/seKeRnNoMz
 2cXwxrajBOqexSG/zBTNJQEST9gCI2CounVNH0f8yeO0Lt4yWsDoulEMs9q+PxT3yZEfKQAbhhO
 FltMev2y42/UWYUdPQ3NW1jk9NiARWNWDCx+R8L6rZyYsA49HnLrgHr2JN/edZ7tDvvt/K9Cc/m
 c9AsUFeWKP1rukmWbof5qn41p3hpL/kiMouYzK0R5mWXm7EfxIzvzKQ4eR6bWLw3VaJCZBuu9JV
 QG2xKk3nE2Srvr6/gDFcZ8VzS7QiP45sNJ4wFgVKM9IkF6cHbUkCPQDq/C4BiiC4BUCV5Afl2UJ
 7N6ZkPO5w5WR/i9ifVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170218

On 26-09-17 17:11:02, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
