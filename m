Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC1C3793BF
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 04:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238547; cv=none; b=gxk4IJrDuFPUWPxD0UNeatmOjUM9o3wHgu79hFPPe+8REFurxsS+7ipnTejMpuaV5gxrMMgMVkpqm8YSH4rrrzpvps5+emgzXdC1FMcNttoo7jQtAnCzx/6B6CLtNmAzQtt0DIgeT5c2TDZkoNRaxXKKngFqar4E4cNwfLo0kKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238547; c=relaxed/simple;
	bh=Qq3QPHQQplIj6vQL+RwVx0v0hCi7JnuK1p9NR1v+1HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9ZBtqHui2+XifrEBx8a7oUbkttv7yOsCL+W1HILZyCH0jpokeArGYG3v1H+BKHOXZV03flYYakGq4OqGlwFCgl2ChvLNcrL28GrLTwPMZZEeWjfoEL0b5hFLfh1QIDLhItiSdya1QpkIv0rpLuWMmLjh4PcXOltb3Ba8TQYk1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeNuPdkj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sdm8P+cy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeNuPdkj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sdm8P+cy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BpVM2505976
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 04:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=; b=jeNuPdkj9czCH5HS
	Qt/sYulB+z5oP1QJXs2uwCW5tjaz1/QC5zHG5zG/ouxsZMCgo/zFXi5AMzUI3kaW
	Tidbokmz2FhKgBRrloIaek3XOLVs7HFbdvIXr5LV0klebXwQGtgh0aTznMcRZGLS
	Jzq0L+adYfkhdzni7WrAvoqtkjqCH99MkXju/iRzPwC9CWQb9b/0v72h5jnz+TfN
	UJ977nI/ixrn2D59bRs1M8aPtdcCWQoKMKn3RO7lfc/ZZgPJSfHk2yX3a3aCWalI
	F2hyK1MP99EXqPY1s5hngemSs068soo91mr755/CwLObP3U31/5bGydZVkEjfuOi
	ZI/3Lg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbj3hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 04:29:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842446a3851so338558b3a.0
        for <imx@lists.linux.dev>; Thu, 11 Jun 2026 21:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781238544; x=1781843344; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=;
        b=Sdm8P+cysSLpcsOeIdvoodr+rkImMiRN/PKDQ0psPEwRtNM4H1d914kf6UDRAAUIi+
         YE0X3g+z1EA51kCPxE8ZkR0DUd2IPnl7hvlSwsiScPRf68pD62LmUBcbBtythlOg+ceo
         TzMByDRmqWwISKGwpwY4l9sXGeuTuVpoEkQ3weXIAbs4niNSAKRBhtoyR0OVMZDdiyPX
         7brw47zpLBzGQo2Bn7KS9AJ2j+uKmvWSnlp8lFf8SQNGfiipKh29qi0Jc/aQ2Z0NtSxx
         EaztEBLjhw50z4yzeNFE+xp+g46aGkGCIMJApE6FN4Q0tLdfHkoAzfh9jeozUb4x2ko6
         dofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781238544; x=1781843344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=;
        b=SNdRPz/tvR7sIh3JFzQZz3Nj7j9385pqd/A9N260pLOtD+owsHzSAMHmtpgO8fLk/w
         gTVYq8/+wJyHpma8BvZSbBYu8c9tTu9bQvNMHDJ/H44md1ZLo6514bl4KcWmCLU/2+kn
         ha1zRMAi2p1eSfHO9/b6Pu0nWDskai03u8iRN6y4gl66Nkoi2+EnRqPaWu8QyDvsZLQR
         ZobCyshDkXW0PW4wAAy06G20fYIOKE3yjkg4zqFMp1anNt25DI/ixSnAoH4QXSW8ACco
         1BckiPw+v55UhPvMT7ztCgi2KuKvpPsUzu4DhIpfCjULdyavz6kjiDt1Z0gul50j5EM9
         1rVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zB2NQPeeIgPDeiiCNU10cDLApprsCOqgqz9+J7sFr6yuUpaQDCpsClhWsAJu5Si+L+qs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOc4RMs0NGFSycWdEnoAtBK75AWZOBnk2/+3Sdi9XjsUmqlwBI
	DE+NrIROVnutO/WVGkWSlvTSLFYxaBNiGKFK+bIav/dIk5aYKyq1ZGmqfP+xpBKTTDOlma7P3NM
	BymecHBapgKNrW4+0Rc8fR3QX2JJdWx0kDiQpcAG1LClP8AkQNTf4W7g=
X-Gm-Gg: Acq92OHkqCXzoBSQO40jObxtdsCz9mCGy7Nbcbe/XEi/yMu5RosxkcB7+F8BZJmFXAQ
	UCecXhYxGA/j+ybq70JohpDmuQ6VJQcqFEz5SYRtNQFLRm4U18LbUn8jhloyzOnSFw14qzX210T
	jMCYdw71a+M1SdNAkbgLQ3OEa4oYatMDDJpm8MDCfKlY44wMfRO2B3eOgm5WEoiEAkkilEUDZfM
	NzIfkIgy3J4TYeWPA9iredv9i1cpRLZVzKTBjUWteL7qNdtxx/zqrh2VEceHVxhAoQ8z21NBUpa
	rejOEyGYWu508r50MitScTMpdvQev3sp2K6Is9AcOBVuaMZEszZYqh52udg1GExZaY3Ds4ev6Cs
	+jmtSlKD7sGxDJY95PmSaQGFkUgTFYJ7lyDFsigsbWuAaSiDGtsM=
X-Received: by 2002:a05:6a00:22d1:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-8434ce0e251mr1229409b3a.31.1781238544386;
        Thu, 11 Jun 2026 21:29:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d1:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-8434ce0e251mr1229378b3a.31.1781238543954;
        Thu, 11 Jun 2026 21:29:03 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd50e6sm711452b3a.30.2026.06.11.21.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 21:29:03 -0700 (PDT)
Message-ID: <ce7a9067-bde1-4989-81ce-c5663a20ad32@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 09:58:54 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
 <20260608-reliable-vivid-stork-f4ea6c@quoll>
 <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pyuQkPF-_gx7EMs2rl9A-AW6gcbhgD-P
X-Proofpoint-ORIG-GUID: pyuQkPF-_gx7EMs2rl9A-AW6gcbhgD-P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAzNyBTYWx0ZWRfX6F4ceALnGbf/
 GRoKaWFCo5iihWog2YH28GM/SZyQNS3NTaXsq1FtoexptKB6J3KmA3dfOefvubVv/skTmc1grkH
 DD59y5V2Mr/E35bobG3hoUYSUqAxjLM=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b8b11 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=OmvEUramPnncoLCXQdkA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAzNyBTYWx0ZWRfX2cY2rfckLe9U
 OZ4PbOD7boHqaq1/h9BFvVAlOeGxjjoLgtAz8bla3/gK0d7neZfaGd07+1oAtG9aBWnS97hUZYR
 PULYMo7COJN0v20FEbih3aVXcxm/3tk1D5bF45hfp0UkXSzrgSJfjCpCjwDhT4x71V8d8k8lkwy
 dFCRcM2bac8ZQRn66v/QlG+rW1HXWx9vocn5Cw+yPQMDX46gT7rK/Wm5r1l3Pmkli0KDfjpQ2P8
 TN5COpLvUrhZnkSDC9qYnMOHRdmwkZaUzLrfbIHmxtct/559zSUuKXz7H+5Yg8I1mzG4qC7Q9ZN
 3oRGPsAOW0kp/GA+bRbDpzOwCq7PRm9CwDVkjW3rB+zINk4U5rSux+li8hvHUqDqgIlQ5JA2pTT
 uWJooh2TBbhwGJzcqj/ZJA7gbuE9zy0HqiIr7/7Bz//Pz2Cfk/HbKoMFvFMSprwF+3ixgrLZCYy
 HSuakWwTc5FrJUDRsDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120037



On 11-06-2026 20:06, Bryan O'Donoghue wrote:
> 
> @Nihal.
> 
> If this is the only change you get asked to make, I will just fix this up on application for you. There's no need to v3 the series for this.

Thank you for offering to fix this up on application.
That works for me!

--
Regards,
Nihal Kumar Gupta
