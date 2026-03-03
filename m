Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA14347C6
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543503; cv=none; b=pLi90TW/HotU77OGZJ4k4YmQ+cIPY4yHB1bNorQ8rTrGx68vM1Fk7S7lsE00/L7LBWc0AUdUBk9LBsZNrjFm5ERA1jKhIAGqMccPr8EOdyiMeQFIYI88XKXYD9EDWEJGrg6yVWDIzPOTU+7i9tDtLgD9DMHfIMlgqZxD7/6Au1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543503; c=relaxed/simple;
	bh=ozN+qojTTgLnsoEN6uH9ZEIQmW3hWK859Xy3p8UVIPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbD3k6lKRboMrd/ACP7i1yJtGUeEb/V7d8Rkb9aFBEcbp7oZh3GzwOnmPglxAIvqfzrsPKnD56x8WDB3zPzQ1uUHV7WID6MUy7r5WWJC0i3bEs0D24r8ZH4bsMDf+k7nf7oLDO5iqZSitk+Sq7o1h08KNxq8FVNukMxsbrnr+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kalYhP+L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5or2asV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kalYhP+L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5or2asV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n7Aw2630006
	for <imx@lists.linux.dev>; Tue, 3 Mar 2026 13:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=snhnMYJDQkat9qXJwHdTGT4j
	0E3K9+24fQ/tGb/FHwE=; b=kalYhP+Ltoz84W/vWpoW3Ii5QCbGAfW/QxzwlkqT
	0llIux2NAdG/Lf8YjRtWyP/7DsUZFv6+ZMDvvxiJ0wWmFChR/GLxvaoAF4QGzyfw
	wQ6oHsOsCh12Tpt97Y4wG85YP4Kqgci4U0wLYuYK6hjj6OXSWDLHuJPTOFZlbody
	YUzJ/gifjsdCS9xx0Kmh1fSVttTEpFYg0nfI+BGjuuCZczSHt/UBePVHf9zEfr2y
	pCqIAH43GGnudV9Qt4k4gwLtYbZZVZZnxRpP+O5ZUItZK2NAp4ctxtooDyGisZj+
	bG2C2oPJNe3bnh9Sq/g7kCRnM69I1vrwVnEfAOTUtV7d9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5awbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 03 Mar 2026 13:11:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso3806838885a.2
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 05:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543501; x=1773148301; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snhnMYJDQkat9qXJwHdTGT4j0E3K9+24fQ/tGb/FHwE=;
        b=W5or2asV4TJj1pZNdxGihF8l5wiCjF6hIww5jWBbI7jtr6vBFVMoAHVoAeLqc+CXg8
         N0zmYxRmS+zZbWYjLOy4niHNaazW9AXlErjf/uGhzeT0Sr6hzHP0FP5GnDb4nx63uI88
         9oR1zGItOOFn8dGDZ6k0MGBcKnw6k6SiFag8sbUA/8S5XTGR3FvW9+7ZfgfAxqmnl8xC
         HMuCt4CORJiXCsY4m4RixgjtdST/GOQYdISnEYaKyTAAQChzpXwo5qaJHTXfzuf4Rmka
         Q6CcQWf0E5b18I3D3UcrIT1BYdxjtj7QrwkVHN3arA1dsUqwZM/exIqJGRxSlPHemBDU
         PTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543501; x=1773148301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snhnMYJDQkat9qXJwHdTGT4j0E3K9+24fQ/tGb/FHwE=;
        b=WvpH9D1jCc1SNCE0OZYInmwyge6E4VKVJMSFxrX1WbAxtUNzw9Xn91sDwPificozj9
         oJivixQypTH1JS7W/MjEuTEQT+4EDXFpncG+8qno1rBiIMxQERuKckY7DuyeNqnaCtWA
         beNKiXqrF4ThgmUEM8tf7fTpOzLSzAAEqhaiLscCUjqn95XY1EE+yNXA88/Oa1NzIrzF
         NTqcB7c+QoC4uJxsmvZw48McQXecfcHzjuf69y61BxLKQFnfDY3jYAgwDwKE+CvuGggh
         e7jMtlqh/ZvcTAX5C0I57PHqa+EM/lYS9ZFS4nGK6wjUdcRdFtCwM5NzZSBu3iMFLe8D
         e+qg==
X-Forwarded-Encrypted: i=1; AJvYcCUjzKiKi77gYDIj83oA599WkGNEC5oi5Liz2/Ec9ie746WyboJFnBLq5g9exHtkLakBOSA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn5l/FF1rbaCvxW+LBgwuQ/+SrlZpWRbyA5jTLBNvmud74MMdK
	6iymXts4fQSAtyJpFfbo+bajoFTT0kvKYho/mGyZy9dJrWQZLEL3X+D7ZvF9MPB6Kz0VmSMcRBn
	8PGlxJ2ivyVDsG2svs/rh2YgrKwO1PdWF+9E7bOI0KGGYJJpAQHlg3ZI=
X-Gm-Gg: ATEYQzyCZrFtynZSuAnuk/SKHJQ1Xg6PK38iePOJ9OTFfdrfYm7fcmMDzns7S7Vu3q1
	3tEzNe864NxA9IfWCFuL52F66xHV5vXYH8YNpPtd5zJTHKe6y92EAn9A4izVvhsT7kpZczDiwNN
	wpzeAdwT/ja2HrEf9kwdnaS0bWnVRjXHSQeYvMpbf+pcXxCHFMXWtQWcrDW17JQmpmAtAMmGa9k
	3BvBDaQDVHWx53tirYvZe5k4YHk8a50G26mSMojCDiXlBOj1VWo5grrbazfA+hhhETPrvmsCFvh
	ufHF6FEDO9I23Ut0jY9+T3rgJ3P7n9gTHmo2I21/90K3aJ9bfyHLKyAV1EuFGfM9s0Cjflp/Vaq
	Av0/du/o5moO12WJVLa+jpL94EWzUnhwbDbIA
X-Received: by 2002:a05:620a:1706:b0:8ca:2cf9:819d with SMTP id af79cd13be357-8cbc8d9a85amr2048341585a.26.1772543500784;
        Tue, 03 Mar 2026 05:11:40 -0800 (PST)
X-Received: by 2002:a05:620a:1706:b0:8ca:2cf9:819d with SMTP id af79cd13be357-8cbc8d9a85amr2048333885a.26.1772543500109;
        Tue, 03 Mar 2026 05:11:40 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ebsm16384845e9.1.2026.03.03.05.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:11:38 -0800 (PST)
Date: Tue, 3 Mar 2026 15:11:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/3] ARM: dts: imx6: cleanup imx6/7 CCM related
 CHECK_DTBS warnings
Message-ID: <56f6t2u5peqndhfwxubvhcksusrgkxpqd5woz3i46gpl3q7vc2@5ykg5q6acn5a>
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com>
 <aaYKUC7pWjS1Xnpd@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaYKUC7pWjS1Xnpd@lizhi-Precision-Tower-5810>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNCBTYWx0ZWRfXwb/bNbw7YcaK
 l1YiAAV9Y2DjM0N5G1UjB/Tf2SM4aFu3ptSeOWz88WxZoZJYyyPaiZQGdXXnCnG+B5N/5kNxRdz
 YIc7RuKiuESxCcLsI6sUut6n/UsBkWqhTuDdbWezplpgy9Zdn843Jh1g81ISRhea9C4W7CjxWwW
 ymRt6fcftBmGqAkMVl/1Gh9eMeHuRzhRQ4xTNci4Zn3KD8cNdIp1szXGJMx/nWFodksMOEy99y8
 EUJrgwSANPkEaEy4GpXJodPaD6Mzqt4yDkYUIUORoU73eby1cN2Ap3qJgIA1T+bBdnlTqKImbF0
 EJGhftYJI6Y/HcRorgPIlGBrs2L1Vsbe5c4PmN0Z5lMINqMDAtqVzSocjL3Av0JDGCyPf7BWp+G
 gA7hq3QtdYo1p6JAGR0GgqJxP/KQQz1Dq2QTW2HYsdUzt4ewj/PgyTCJhcByVPU8HhuyXBTfAyy
 yg/02O9+oQibzaZzS1Q==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6de0d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8AirrxEcAAAA:8 a=poxx6UPob8T2UUUd9QAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: EV4b20XL2-hlih4g-3Ci4NP5on_k3y-o
X-Proofpoint-ORIG-GUID: EV4b20XL2-hlih4g-3Ci4NP5on_k3y-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030104

On 26-03-02 17:08:16, Frank Li wrote:
> On Wed, Jan 21, 2026 at 01:04:14PM -0500, Frank Li wrote:
> > cleanup imx6/7 CCM related CHECK_DTBS warnings
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> Abel Vesa:
> 
> 	Can you help pick binding part?  So I can start pick dts part.

Done.

Thanks.
