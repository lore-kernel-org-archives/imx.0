Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848964E4324
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658781; cv=none; b=qVtCkcF+qYbApD8dfB8QQSGhd5SH8jfwlCTVSeo18kAUxTR3PP1Pyaw4gsGJQAsBswc53O1IteXj3vuRrPkB74WWhlVeJp8ygH/ipwtVM1rnja6LdVZRaNJ7608G1j4sPwy36D81lHnlF8aEZo/7Iuu8zB+GgDPxc4aHyMkeVq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658781; c=relaxed/simple;
	bh=3qmlskWMzY85Oikfhb/KXg46Z6tfOC9OdCPH+ZehnJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzRNsVxCW/jA8YSuio/TcAWGiArF5zxfwXgcx85GyPHNa0UYtefqmzm/c+qev3do7cxERyqS2A5kCUj8KNnMgRAaCZlytdvawL7UNIYT8zld6DJTDzyXQ0IyiT5E5HwZbqrcaEs9GIGOEZ3SaRHXGsYJVvwI5cDK3WHawRN79Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/r+rU3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hk5pKZs0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/r+rU3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hk5pKZs0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjdgk1307355
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ln57oQHyBkL7V+ZLstDX/rR8
	u1lfqU3aYXYeyOqWe4E=; b=U/r+rU3nLB+dvF0TXAM7NKyQDeLKUjbIyQ8IyH8q
	zHYKb7kGN7xu4WIAEOq4K9kOAyIvvKrJ3us66pLC62z5kP/9cEDYX7xB1ohEIOA5
	CcJTkZL8NVU8CFt8i9qCv73hftU1mjLTZUcXG8tftC1nrPH8qsMPuMowLxI4OKd9
	Bo1VMNr4MCVaX3OCEqqHHZ9Ygln1anRO/2vULSoIgjpp/5mHU+H7D2RwLYK7FlhP
	4vGTGMXKRXE0/az1woszeD7DVx1bvtnoq5gLTuxthBZxOpU+oqwhTYgG13Urn0B3
	lbJS+5dTNrKq5DB5mVH2xqhGre5Go7S74NzJPqWtTyeXjw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra9vjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:26:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9105cf082f7so18962126d6.2
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658767; x=1790263567; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=;
        b=Hk5pKZs0BuOFoO16jpfvQJDfBfWXJ8pz2A/yzgPb4K6N9KTfqeawP9J9k6WmTrBPcd
         6QV/sHaSvYweCcMCJZgdMG3P17MQLxhOAWBUQ8HNTqNKHfAkJH3Qb3yP8evTQ5VBOwkL
         hoMbArjswLucfUIg43VaGytBBh8E26xDI2WJKhldFgp6KUPj/owwsjODDntgo5WrBhC2
         M9Y7YBQ57h6fsG1/m4vd1Yzfxso8zQp0NCTrjdPTEH1dR2YdcbWUP/9KVoGzrOrkPJJw
         zLcUPZKFppLnD4uDuzXjgwBQbHdR5kUmzEb6dL1/l3hF1qi3j7mIlKMJ6meVxJ0OLEQv
         edAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658767; x=1790263567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ln57oQHyBkL7V+ZLstDX/rR8u1lfqU3aYXYeyOqWe4E=;
        b=yvHgHWcuP3Ykwn90uJLFCbyt55Ogb4MTRD7mcwPD88rghukrPIZXeFRA8WTYveqY/V
         qP4TsjfoJwmseUOUR2S7tTzOwexeTkycZeZlX4pdDYYhU3cJHAujWKHpq15ZxWo14nCF
         LJHFSVBXPuCQDEvEVVNActzG/K1Tk0deLe2nwm57Opm2hKl0lrqY5aWHKnOV3WkyGyUI
         mF46x9TCaTz62wflqFZMhPiZy/kxHLKUxaIMowvafbsQXDy/+ZYWEEhLoy2R9oV6bpWV
         azxsVvwVgB/kwO4RTQQsvGpHd9sxBfaKvyAdzP6WwTXFJn6Xw5w3GYQUcMe0D6a5Itvs
         8TDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFa4heGACxEIocaKvMf9s2wXNQloS68fmig5vdFuF3bl4D6ujd1eesnQTAt9HnjSl+F1k=@lists.linux.dev
X-Gm-Message-State: AFuF++nM20492RLWPlkmmCElN3jU51hoT99znRnvjqp5WYo+z4wzZ0vZ
	BQGFU8O8VucAqOOywLhatXJJRxLoGBfKc6fZ511IG3Wvw1foOor27YbAC6qphVls1A5IHRrxZDv
	9buBaeBSABpSojvIjNz6hgXNdSJAhKFk99qy4AV1eFTZz++TlypGjutI=
X-Gm-Gg: AYBFou01vsp24bRW+7wT8ebkkK7GTzeV570BtdMXz7Msp/cbZhnvxaDbD4+h7Eno+7d
	L3ijMYVvOC9gNSl+MG5nw31SmEJMLzAASCS4ZQPlJpt7/3+kY5eH2Lw1aTpruKL7bp+afol/ETu
	hYYFovNtJ00pDuZwYDfzfvWyObLDnoEcdY+nlU3l0s3Xxyo6JxHD9tbYdi9jqA7aWzwS4edOO3q
	wxbdzmlCUI55sZnTDLS+NNQDuegKLkfhF1QukrZKud69segJ8MuIeH1S/4R3Ifg1GFShAq5V6cQ
	qKUUOfeJ5PYEbWy06zHiDoLOhOStsHYulkF3ksx+tf5p1IZrrG4YHUrv2hfJG2HqMc4AfqJmtIE
	utLYEDksgKCSBchE=
X-Received: by 2002:a05:6214:5b86:b0:912:264a:874b with SMTP id 6a1803df08f44-9123d70d4a8mr129825946d6.8.1789658766442;
        Thu, 17 Sep 2026 08:26:06 -0700 (PDT)
X-Received: by 2002:a05:6214:5b86:b0:912:264a:874b with SMTP id 6a1803df08f44-9123d70d4a8mr129825146d6.8.1789658765936;
        Thu, 17 Sep 2026 08:26:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232d5bsm82102005e9.12.2026.09.17.08.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:26:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:26:02 +0300
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
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/5] arm64: dts: qcom: shikra: Add CAMSS node for
 Shikra
Message-ID: <2zraylrv7h25qgkxbqpq7rg7nodw7hsajshsdxxf5gsgtrigxy@3keepqqao3eb>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-1-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX4tbgZFE+dulx
 sY5/YBpi0YohEeKIdI9x/ul3skUTzs+zHpDeE2mbhvIM4Y/Kseh3+aXi9XSLE3T32hUTA2eKLKz
 zJsWcqBZubZ7I3vQSsgsXviYg66G7Xk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX3dM7Z9TId7Lk
 sW6DOrkt5WLM4YxYOhx0OIg/oCD7OfdM4irP4fqa9eUSiejwFW0uIwFYTAfBi7a+7yJ4yrKsJi9
 zvcpj/GuNExDzrXY1sQCGqvUtGD13TtjX0N64fHiQXpws+ZX0/YiXsj+77Ld80vX+kmF2bcU6NK
 gnKvjNaqgE9tfNK9VVQFXtspQmulxUBoQnRUaj8w5Dil7fCL+sY7SMkQS/Bgw+IWKQfBMs0BHfi
 U7kK8/RN3Kh/ftREsBUBcAw/TvhL6BY25xg5NUv3/0qm3eNGWLH8gFNDTNDFH9NuwMfwtWmznNw
 ptdJBGZpt1JYYerOiOmSuu1FVY4YvWYzaNfJdKb2ys7juv+k1wAa+Puv5AmgYjBlLuii5ZeLtpz
 1MIspqI/qxNZkvr97emaKP+NJtvIbqrQLXje275lef9Mc9AxrJezxDAc/B0R9O0erEg4QuN4Z/R
 1yjH3814w31YjEFc7FA==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac068f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UaYWxjhtoCKzqXHoqhVJJ5ad_s9iXwjt
X-Proofpoint-ORIG-GUID: UaYWxjhtoCKzqXHoqhVJJ5ad_s9iXwjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170218

On 26-09-17 17:11:00, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
