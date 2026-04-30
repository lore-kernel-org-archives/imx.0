Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A5A39C017
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558313; cv=none; b=EZaM1ErbppeDxa4tXFceRypUsgXHhfMIlDvqz0OaJN9uOUe2tLNcRnBdLRs2taoAVmx2VeOX3VIw2OAC7kBQzzDS3QkVK1wgeNGJ8Y6lZ/DhwwoNdaCRqo1iFczds+fiuCJirWTKHopPiTBvjOdiGPiJvGfMcobWeAkjBdVJIP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558313; c=relaxed/simple;
	bh=cQcDm+jcQXGu8G7NUBXSCzwRptDfgMeJfNsJ/0RT1fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNAmcwR/nlXFB4cSy8GX+eJ40GVMpt7RAqtv5laPukQyHIWQI8G5p76vZ+mxN1V+Bk1jVdDNtNL81D7E+RubmO0S9pRoC/jUzqey+YIR/H7lxKcfql2t6JQgIILE0XJlPoqC4+MgVrzS2t8ckRth3cTwVrKeMtLZ+nvm4QAtqBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2X9oZqP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PVrUqCyv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2X9oZqP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PVrUqCyv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UCOYkx088766
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 14:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vyYoLTi8GYiSZqan+G11SXyK2akK8tJyikgcHdifI4=; b=j2X9oZqPLz+UHBiP
	RS2Lc2vJBwhQZVagFXd41VwGaatlHgh24H8Wpn2ElgwnhXElKwMj7oUmgZANUVUB
	pLMuJ4qX9NvwAHPUK3vtTtf8Wc9fImzEgL3iuXFXpxmhb1O/Xut4psICF5citegD
	R80JbFWQey/A8lSbPHN1T7J6ccq2UtFTAwmp9hmHBg5s20Xtfqb8GrPBFCLpKVXn
	Gp1wZO/HLfEgin6BTsFKe7GqffLCnP3YoBdduZ2uD5DrgM6tV8+lLhsNchgD4VC6
	iccRY9KfXCcluQhAovGlkwdus0pm0vnQHmAzb0pcsbjvExqokMCIjI0eU0K+kdQs
	+DnKRw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u41w06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 14:11:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f8a5c02b4so60217e0c.2
        for <imx@lists.linux.dev>; Thu, 30 Apr 2026 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777558309; x=1778163109; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6vyYoLTi8GYiSZqan+G11SXyK2akK8tJyikgcHdifI4=;
        b=PVrUqCyvLyLWxsxFyiH4HYi0jH4F2dWLnd8P/S0gX0gbaoZfcsmRqSXHO4oCIGdfsB
         uArhKbLGwmBNZLdUIeYZ5NWrgScuZHfbbE3QnD+db9JvRXeGcJdInUpqNLItvV3lNqIP
         Zxa37ah7gaGG09YU1M8S9ofFJv52PJoirFQ/xxqjrhcDonwq4AT9x6K+PoOsUM+b8Nsx
         bxL8pSzu8PkTQoEByojCXTd45ibG38E027iaCSZb+JjWkDv8z0OitxuhlkXfvhJCdXZO
         9OTiZzb6gX4JwA5dKLT87AIYe7/AIF/iE+RD5SbO2VuTFTsMzqPa4+N5K9l0QMN4kkmn
         oDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777558309; x=1778163109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vyYoLTi8GYiSZqan+G11SXyK2akK8tJyikgcHdifI4=;
        b=CTKCVCGcxl2HB4WeBcvU9AJWMcxVLSOYQQLF5U4YO2FzKOctQwQ4hE8m7fFWEroFxC
         Z+8AUgMrZfwahEU0rN5HJlctxfHGlNX1fbU3Ohyz24Snz6tUizxVrq07ECV4gjoZryPU
         qtUsHjDSTdqiUlNR2pkc4qjkRy85XZtfAQTCGYgZ5YOWMdHzpkyW+dAJQxyIGjmfl6lw
         7W4yZ+/Wojq5HlW/QTc9KU67NbUD47dN/pFO03Q2Opo2owFllCOoXHCJSoL1uxYup4+J
         DefNCND+Wi7fzqUKFQdbJ7tYFXP8L8P6w3RFcxPhT0ckJIpovz1U+UpOOvQurxwnS60q
         ldOg==
X-Forwarded-Encrypted: i=1; AFNElJ/sNRA/bOCUuxt/JBeP7KnBbIeBhDVHiCjxFD7O76BL7km9N9ngEY51sUw2rLaFjAiARlY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwY/cBAuOe/AUzFr86BDC/l6kqAuK+ItGPYoxRA5o+Bp90rW2iF
	FrilGC97Eaf8oapPq8sO8jaGDZw6Tplg1eT6Fx38bSDhe+hnI6dxOopfrRsffZ41pKTiSrQEvoW
	zjWuWL6ne7tJI5adKGv8b05T/FyeGoiKi8vbUy0sf+erBIJpZmDfpGrk=
X-Gm-Gg: AeBDiesDE4VIrMSxM6vqy+//3AmCEwhBBTpWe16HH26C+1gBaFge7LOVVnqnaYZhIeW
	0IweyGn6i/14lbwAV9nnLxFh4FXtTlUvr3GS6Qn+1FMpMrQ1cceO6HHoKh3/R3N1EWjO0psyASd
	iWsZquOwdw/86K/uid/OA+Sf5jA37gN3CFx6gq7DmDdYEBVDenULjlExDMVzAGIvQ3Sie231Zxz
	B5srSKNhe/eFh9v3KwmFIqh3mjxVyRI93/b0KHs7jndyRDzeoWe2U9oG/eROb9gHM1RRk2nFRlh
	qzgLZrGcIQ82ETvv7e03S1Z7/L7540pk+gqMeSx4eYJAHaEJICa/dyYChyelN57s4Fz/xUWEedA
	PyDLbKN2LZGA5d12A4+US3cp8wx7z5k1lFm2Y3N2oSfy9hPHQe4QzboFdNfMT0srB4tX2LA3Pjy
	KqJcNJJlEhVGs70Q==
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr445976e0c.3.1777558308650;
        Thu, 30 Apr 2026 07:11:48 -0700 (PDT)
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr445941e0c.3.1777558308167;
        Thu, 30 Apr 2026 07:11:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98543bf48sm242041966b.41.2026.04.30.07.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:11:47 -0700 (PDT)
Message-ID: <6e46514e-91de-4d1c-8eb0-d1688e0a3821@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:11:43 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: imola: add support for media
 carrier board
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org
Cc: linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-4-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430132140.30369-4-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f36325 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=fPU3a_ZXxuRe2O7PCEMA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 7Z8f8IR9hkP_TL-uo54IQDeOX6sLHfG_
X-Proofpoint-GUID: 7Z8f8IR9hkP_TL-uo54IQDeOX6sLHfG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NiBTYWx0ZWRfXyrxczJSl5zOh
 TJucb9RcY6PNunt2zeOL/Y3j4N5OD0d8yUd8MCiqU1bAnp0pOqgHLCTMfl9oIYi2QezOkZKH6f7
 TAcCzU5RggVDEMIWhLEoqwGxT+7kkzYJN/iPqi0MSxxPef2vVmBU7guVNpCQPjd4tuOfvb/hYQ7
 /xksqVeQEyGBSGvTySmgdf43z+/NMKBKbGjOlyi9IRjg88rKC6KFcIAT3Z+57dTFw89j3Lt3cNV
 Gq9kFkeiaaAQ1ks+Al2JGNTtmY0Gdzc4W3Bkf7qQdM84ZwODwSIGZpU7wRGimH7D65ZXbMTyyR3
 jbnVLbdePIbUcF0cdm1sR+cFHAhw6PLwXe/OWUPSG3fSmq0Ufk73dg005tcxXGZHBBxkHkkagvL
 AEwgUHV3qW1INcnI3Di8Wd/fPjlmNiyq6vbFx7RRrPWQtaXoMp3gpKjymnQneEQN2+HQcGktore
 WMUflvbibR7BK9uknnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300146

On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> Media Carrier is an expansion board for Arduino UNO Q.
> It adds two CSI connector, one DSI connector, 3 jack connectors for
> headphones, earphone and lineout and 4 RGB LEDs.
> 
> Current devicetree overlays support:
>  - imx219 based cameras (both with 4 lanes and 2 lanes)
>  - Waveshare 5" and 8" touch A DSI displays.
> 
> As can be noticed DTBOs are split and no overlay is performed in the
> Makefile. Overlaying is handled in user-space guiding users to configure
> the system matching what it is connected to the Media Carrier.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   8 ++
>  ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
>  ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
>  ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
>  ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++

Are the 2ln DTs actually useful in practice?
>  ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
>  ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
>  ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++

The waveshare,dsi-touch-gpio compatible is absent upstream and I
would imagine it'll take a considerable amount of time for that to
change, let's focus on the other bits for now

Konrad
