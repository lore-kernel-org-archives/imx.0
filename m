Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5D91D61B7
	for <imx@lists.linux.dev>; Sun, 21 Jun 2026 06:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782021674; cv=none; b=LfaNUlAjKBOkpADgx1Ae+3RBHkMu2eIp51jgsULZczwCOGkE6LNULKbSz23n93zenuElJlo54vkTLjGSP3oz8jLNenjs8dFic13MTaXB6gRj63WtJ+LQTdz4uEoQFec1uQkP4m6czSC/Va7u3/pUu2KZtN0vS/92GABsh/e6V9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782021674; c=relaxed/simple;
	bh=Ps4FYVhY/+AWPZL6Cgx+yY0Oak9eRrn0s+QgtMMDndc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6LqqCFn+YDA4o9zcI9FdqD+hH/5DOhnUBFcfDAfwZ3JYHgZ1+AmX3jUqGtNM9WVh5TbhU48c2uuITPuCwrYWu7FJInLjS7T8Uww1Dy/tRiJBuS4GALAe+rYXjGMPH+4b8yMfbubuXne8MUWguU7psoyxrvcG7bm0QEqWMwj34U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWAavCub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDxQe8qW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWAavCub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDxQe8qW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L101mH448339
	for <imx@lists.linux.dev>; Sun, 21 Jun 2026 06:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=; b=bWAavCubaAeSbQ2B
	5X7Tk45bwritVIUZ6q7ChKGUS5amfhJX7i6Jd3+U8KstjQVYB//B890waTbupy9b
	tJGRNDICPR1Jmflh+TmMNV29BxRzu7Cc+SFEay0RQthRnVPYESrrpI7WkU5VD143
	wexfNLzPJ1ZnOnb5OMuuIkR5VKYO2anf62kK7rZAWbyQvF5FH3QEr+Vm42Q+MPG1
	8okJYHbaGa4baOhiXL9wGya+HQK2q/qefMZ1x09nSEovfWnr1czKkIP5oN2215pS
	vJF2COzVkgD5GEGRKuUE12Bl+jL8bxINXTToZzgEPUkQFTGeZEl5+zA5C8N8CehX
	pcEM4A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm58278g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 21 Jun 2026 06:01:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f6247c6so4048888b3a.3
        for <imx@lists.linux.dev>; Sat, 20 Jun 2026 23:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782021671; x=1782626471; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=;
        b=eDxQe8qWJgeZpXYqo4oxgDDsNeIZUm2wYNisf6+L6M2q5KBsHy6ZJ6HwUb/f9qHWOG
         kQ7O5DqMGHzWBv1SNhLrhQJt6si8hKSDqRw1DjLFdkP4DG67fjS53BvFkB4jMeQqiYQI
         0vzWDeAfp9nYL3Iw3WT4pLrmdbFj7ex/MOoDDuylmDSZ+Ei8/ZJ//ONE/L3kaGchjPR5
         l1GWDIr5vM7aguZU1shkt8+oNDxCnVqk6ca8stPcbhKpxnvVpdylyDaWTYmTGtd11TeZ
         KGQXWeBweBNyIOoZZzO2fxIh9OEghYyHp31d5RP2TVSn8mYZNwIUmnmlu59ksnazTtCQ
         m/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782021671; x=1782626471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=;
        b=ZD2cYkPOEFGlegPKVWp3QyUOsBh4HZpJUEI35oajRycmg+FCJFT8VNcdpEuGDlQhkq
         YZq0VQgl+Ug4EaKuw2odgLmvnVZpimpvljGSllWfOMQYrdPmMeXfqr7rRiFyk5bVeurJ
         NmStWPuoPoR3K2kRTvSdz8ab3EjheiLLNG9M93chCuWrQTJLPD8yQZPDnQIYACt0Btfw
         RllS7Wp8EPjFH+0BLMRKOCj0PcaSadhi0dflpKHYgVE250WdrLsqEhg47wZ0DI+uh3CT
         aWfCfI991mp8GLJXkluMSPkv3tlOY3DXVPcvxgQmiOK8PwVHsKExcGlpAkfKS44zKMP2
         BVqw==
X-Forwarded-Encrypted: i=1; AFNElJ+Bo0mANHQUQ5UsWH7E8e7nm+OzUjn6vlTI+pSJnNMDLJx3les18jPn6+RSvhF2NBiG57U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCHzbSj9RSCELPsK2NQrHhZ1CNlx70uHR17gU+qziELKwSO0S4
	aPLJn2ITmLaW+hMVqu3J55Izo4gHYlvq6vNq5T/TUqQ4ERRMcoOxgDv6NWvLmmAcJktkogT5H7x
	UBgopOfcq5npzWHsBGltJrkJAVMb1IGJeDvgY0vQjYX7KfoPkeZmAKHI=
X-Gm-Gg: AfdE7cl0ZJzXoqVRtqLf05j9+P2DLOOUbVEwov04kmNdd+8xvxLb9hIpUTuDSOD+P+N
	RybZ63LA5BTrZ/lj3Vvy785OwLZb6Xj0+Vn4utXzeQQseZmOETLMNWn+0lbPZO/mltGMqO08WSw
	d3PEIauWf2/nhXRIp3+MO9I8GjLw0mwZivlMmkiDqdWOEGOkyoYzlPZa8ZJoKak1JxZOkRkbiby
	pqtpxORcDuHqC1fNhZaNB1Mz3NjcVVDllgRqkgDOvFy716cV91IYyUXu4FX47PZSj0VOGPZInjZ
	xR39PszQJOFRd+hWIty8p71EUj7PKPrbbIvEj23rmi9LQN1Fm8QkrCuySgE0DBef2wmD1EK0RSl
	Xs5NVtl2b2zEbTN628lQ85DOB8nQBl22FECZYfcBTDQ==
X-Received: by 2002:a05:6a00:4385:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-8455078c20dmr11621239b3a.5.1782021671044;
        Sat, 20 Jun 2026 23:01:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4385:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-8455078c20dmr11621188b3a.5.1782021670637;
        Sat, 20 Jun 2026 23:01:10 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.226.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd779sm3823101b3a.53.2026.06.20.23.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 23:01:10 -0700 (PDT)
Message-ID: <cfe1778b-c204-46cd-a9c8-2bcda8ea63ac@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 11:30:59 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
 <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
 <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Jb3zRXvvoEJKl75PmyHCnAqKbj1Rtddm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA1NyBTYWx0ZWRfXz2nSRlzaTVV/
 upCHia0mAs+YjOFL5Y6y0TWsalIDCMIrTgBLuf/oA3ZMdDIwreRtNKrBEJvLJvaBYV8yo+QkRfU
 GXJ1L9kkZMGW0+K9MXo12TSyewc/Iyg=
X-Proofpoint-GUID: Jb3zRXvvoEJKl75PmyHCnAqKbj1Rtddm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA1NyBTYWx0ZWRfX56lpYCI2GXfi
 bpJhbJHwpTTfOYUn0AlLwewvIH6xf5uLqnEt3ZnIIoVQe3r67CYaEvCzX/IKW76Nj7ZLhY5vTum
 h3IzH3OR3sbzAqfIrHx4yX6/NP0gxlsJdJqWiu8dUzHjtrrSFTc+WvSFJBivYz4hIJaGvLJ2EXl
 tuZTIyd7z3FMOh6wWOU7o85Or1Lcxs5p963q/m55OTZX/jGnb94aIw5TdpIblUsp09en3JPEIa/
 ONvZ3uUuW7bx+wANneWS3AVep+PICVd0gsk/UToD6vOy3W1LhcpHJVrME9VnblUmDMzIz9if6pW
 9uDlVaWd2nK5FnYGZWaMJP9y76Ewy3PADpi9lkKV5INXkfSZGhaSmKZYeNb8Iyh1CO1yzMa7B4v
 1jx+mUtRP/KF5+dDPLK3i2HGLgpAW/Sxq6h+xEF4C9QZtzMGtnaWZvfi/JcDi5OkwpM5FCWOAm9
 7CojhiUZXKASQq5wH5g==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a377e27 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Kt9MDo777XuedpO0AoDL9g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=EEnOiY-A6ZLknHPuIi8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210057



On 19-06-2026 21:06, Konrad Dybcio wrote:
>> +			cam_mclk3_default: cam-mclk3-default-state {
>> +				pins = "gpio98";
>> +				function = "cam_mclk";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
> Please try to keep the entries roughly sorted by the pin index
> 
> For the entries themselves:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
ACK, will fix pin ordering in v5 - qup_uart0 (gpio0/1/...) first,
then cci_i2c(gpio36/37/41/42), then mclk0-3(gpio34/35/96/98).

Could you please review the other DTS patches too?

--
Regards,
Nihal Kumar Gupta
