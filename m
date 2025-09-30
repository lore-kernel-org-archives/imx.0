Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A83D2222CB
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759258957; cv=none; b=Cv3FAw6lbfs8q3hIV1QY82AIAN+YMK7NpNvMu9hjSiHwHBjo8l4uaSiv+SaBzZKIn/obxD25y3+HpzCJ0TOTEj1C70r8HzRk5UNuyNS2rsoEQxoH9Of16cQx08h/KAVm7ek2U6EOTmvIMy/OWzWEJ5ZNLf5fKt4b7zch+ZgsWcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759258957; c=relaxed/simple;
	bh=XaKjIs21h7X96FaSfZ/LjO9yTxhBXM+kXjoDRs+GPjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJh085ahTfxibsI2Wb1kXQ+7Q1jnsBxemXvdEIYjJFc+M7uvo5Meed6olbleYZCDZAbEA41VZf0y7XHSBGZo9Qhs4lXpzPGbMKn/YUjWxDCpB73bTGKIH2V0y7yO8go85lDHwe2L6/UlPDDmy7K7cpdsjiV+12Q+4OOYrRBstcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prJio/p1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prJio/p1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBpUhD023779
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 19:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GXlbr7M+4a1GxvAP+G3ZXjJw
	cK9AWRREeeh4emtmxmk=; b=prJio/p1Pa9iQoymrsQUzUwSwVlmy62rZ0boPOeG
	5Co5oHJaznpcAf7BJjir0I0ubdKav7gNDPOI3BNhzvNVU2u1G1uhd2a06abQovcb
	/saq/MhHYC92LvUIaaB4jaXLPQPJtLSaK0t5ErQB6rSk7JyAd3xDQkowIG2rxbUF
	957QygvR48Eomfe6HOQ5Stw7QNm7S+HdvSFGVn+tlzJkmY1II40Vvdyi9BTLN/oG
	i04nl4mMg1WS4TFSJNoHVcmPcipJi5BoYPhGwlfe+D8b8gnSbpNU1REPcDVYQYl4
	JGYK0P8WVNCLk9noVXZFSBzhqetljnENIu2G8LDgl2w9cQ==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n2hbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 19:02:34 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-42765c940c0so53956195ab.3
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 12:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759258953; x=1759863753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXlbr7M+4a1GxvAP+G3ZXjJwcK9AWRREeeh4emtmxmk=;
        b=gjkwJ4G+sQzpbES1zQr6aqEB5m1orrI2+oc5recE69UDq0u5v6tqweAWjpOTj/2TIi
         AuTMPvH7CHTexCjEuohIvDn4q0rV9Tm+Gw1uVa0kd3nRkiBhvXJyIeWjCK9Hvk2VeZ8F
         k82T5vv9JKzx5Pp9PpJtTnWw5pK/gsvSHINz89hE6xu4+whN8iwxIjJKmfMJzpLGBPBA
         /KabCZhGUzNvrcU+JgbF/v0gVxQ3ttLqrSi9YHoixVuvJXg2lIoXKetImnsdIqyJ0FVl
         e9b+Oyw2g/Q6V88ulOBeTgCgRQ5fFYtmuUKptLblGzY4vE/crL9Gykirtacq+SMfCByf
         ojhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4hNVRx3ySXPdnckX4ARmUbonWOj6jMqnZk+p/v4u8DxvBVz8eiJvaCmbX8fTqjfl5v7U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoBVDXZ1lZJPyWrnQkhriqdwio11K9QPk79NuJf6Y4yqiibEoz
	5Ba9uO2iNRDrSodmaIPVn44HSznyTuoI2epU8KWLh8cG6BPG1kAoaQFamXAiNr1K8v083V2l1kT
	Cnoa08/4mzB2nSkZ7x2upSbGmbSWoYnnSLU5Bnn1YdOhRC/RmEF5S0vc=
X-Gm-Gg: ASbGncuVNThNG2uoDPf/A3O+bjUlMMOF96KORmeFjCUiC0Z3Dcj7WYcq5LEupABJEW+
	LxM6H2LB/fmDy54jzmq5MYcCPXO6K+6Z+pEsmpL0PdS6uioZLnirDtwd5bPhJHmjrd07nHazdaJ
	vxT/TvdjtMIm/3mP+PeAejto9VrgsZHFVQpgh9fgD/9IMgizg5+mEtoK2n1JyyG8YJYuR97x0YW
	X2fO30ylyT19SnVqyxhJ1zY+zSlsdCGobl1GkOmgonHF+wbSjgAXjYigPg68HtwXR0B9gptkVep
	gB+vS6yAnVRBRslYg//yzzsrSGP721ucYTvh8cqONUliK3HrXBDOoKXN4CPVO7uuIMkt4DtXbul
	xiwCJCJNIfh8oP4WcgNiyC9ZLNaF+ruq3EJPMlw0Qrap/2NAh0LKefaUIVg==
X-Received: by 2002:a05:6e02:230a:b0:3f2:a771:9fb3 with SMTP id e9e14a558f8ab-42d8162461dmr18055145ab.27.1759258953229;
        Tue, 30 Sep 2025 12:02:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJV3txOav9sQu2ukayU7ugj9yuYkFavKZlUgXjEWPN2HKtbR36iIvOChi6ogqZ1DDolHbXtg==
X-Received: by 2002:a05:6e02:230a:b0:3f2:a771:9fb3 with SMTP id e9e14a558f8ab-42d8162461dmr18054575ab.27.1759258952745;
        Tue, 30 Sep 2025 12:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7fe6b29sm35412471fa.63.2025.09.30.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:02:30 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:02:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <hio5xdgjb6oxejrnk3hy7ylro75p2ebqa6oczyuwuxk3xsbp5l@aewbvmuk3ldk>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
 <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
 <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
X-Proofpoint-GUID: uCa8N9KqhHwvlCsbjOFVz3OI7hGHJzEW
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dc294a cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=jIQbB08qyBSz40biqjoA:9 a=CjuIK1q_8ugA:10
 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-ORIG-GUID: uCa8N9KqhHwvlCsbjOFVz3OI7hGHJzEW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfXxqLGTPRosoMH
 olymbz0j6zVon9j/926G4z5gUGh23XVlOHrx/swYM0Be2z2LDlSgkS5hYNS9mU8iZWu+zF1A4Mh
 ZcpUm/NLTYxJx0gu84HWymmq0A4SsmQSekDo/EbGStwQZgUnoFNj7NfIEshzqtcz3mB3UaqJNkY
 t+5jcAk5pyXwFjveU3hH5sJXf5CmTCgG0bjqOWtLVXL/6qa9ueWH66DGmdcyjhtBgYmJkDm0lGX
 C1hp5YgI5HrggedtcQuzunt1V7Q2N2mHoHV6dL0dSklkrVRF1VNBc9z2xf4oxx5cU9W8+ytFO4h
 gdAQelPhkHUPyoyxC/TGiLL2ZVIfZOZHuBoBIPfgy49Hs2zaa68Gt60fhzZbcQLJbkHByS9SlRZ
 8KmKow10rN0Hr/Fi5oBeFEUUspdTLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Tue, Sep 30, 2025 at 08:48:13PM +0200, Neil Armstrong wrote:
> On 9/30/25 20:43, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
> > > The ports definition currently defined in the usb-switch.yaml
> > > fits standards devices which are either recipient of altmode
> > > muxing and orientation switching events or an element of the
> > > USB Super Speed data lanes.
> > > 
> > > This doesn't necessarely fit combo PHYs like the Qualcomm
> > > USB3/DP Combo which has a different ports representation.
> > > 
> > > Move the ports definition to a separate usb-switch-ports.yaml
> > > and reference it next to the usb-switch.yaml, except for
> > > the Qualcomm USB3/DP Combo PHY bindings.
> > 
> > Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
> > and keep ports definitions inside the usb-switch schema?
> 
> Rob asked to not do that... see https://lore.kernel.org/all/20250905175533.GA1000951-robh@kernel.org/

I'll respond there.


-- 
With best wishes
Dmitry
