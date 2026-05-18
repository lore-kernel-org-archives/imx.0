Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A1C2D838E
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130249; cv=none; b=mwGySq+IwCLeLedXEqFauTib1qHSX1zfKRXuhcJg8PJjLdE2CmDAUHZzN1opda4in2lD3VbP9CbpVAoipAi6rxzxSoBIrVx3wMTq2JpslhPrTC8T+u/JmhimvrsjRC8oJrgYsyrkiog5f6vdF5o4uyZWLgq+fNA3qcxdSpK0Trk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130249; c=relaxed/simple;
	bh=tbM9L4T0r4kFyTO4HhHvWPVRONa0Qs2FI83+6wrG4zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWjFR4+hpx6zp+BrnBU2QULu65Yqtw39A3e0FqnUim2NUvyyb5ZjQrZPZZ6MF7/zkJD3zn6vCJ63WRKful5fG6XYV1F8Y3QMefL2aTY401CthSVKagQ8ZVPOib+Frh4AKjxKqUb8cetj+x0Ip3bwfFaBAZ3L5dFbGkjc3Mhhx8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfCil12s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Am5bTudX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfCil12s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Am5bTudX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IGWtwt2091147
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/SPZpX2kxTAUi5Y+kkH45w7LW+kUEovdQcoR2rE+ic=; b=hfCil12sybDGxC87
	Syyx6rLB01+b/k1NXqfOSmvWaHhsdDZfmecjGMedMBvZblK7WyRjn85e1JDCcN+T
	2Ua1Tf2RuzKrAuFmVW368w+/On6JyDjA9frsPfDekBQ2dN9KooeOW+BOS7e7nthT
	18z/zx/DC9+knWTFwuUDC+LBJ0VZEDjnKfRjeq4m2b6Gd1oaCrowTKTbkqWsI82k
	wUfA9YH/o7Az3rJOc68pkcZ1HntebXUZ0OqCdrA0ANyCvBcAQOsBP09FAuP7nv2R
	nlaHMCqzjXrUTSTmmQsowz0wxmtH2rgUm7e39VUCccYYGoheHvCvezrvP/b2RaIh
	uPu/5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpj1wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 18 May 2026 18:50:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f13da9684so33083351cf.3
        for <imx@lists.linux.dev>; Mon, 18 May 2026 11:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779130246; x=1779735046; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h/SPZpX2kxTAUi5Y+kkH45w7LW+kUEovdQcoR2rE+ic=;
        b=Am5bTudXpX0HS3ZRYhgRssVq0MgUVMywtLWJNv8FvxiMdyrax1Wfo9jVyvbqdJ2j4B
         UYztyhGv49NH6t057LQ4ueEx3eS+bLPKrEBgceT0FEZPSRqVmmFT8bxHcF1/edNjisr0
         ULzVU+8ey9aiPTP8AoyQ1kmOQR66sjcdxqQyZVFj44ERcwLOk2nkBygka55ECkYD8UOF
         CIqexfBbAK8FI9TKyW9Hpg4dorppO0Tv2LEXvUM6dQ1Nn9mcw+IUfCWMDLXSceQq3ZMY
         j9zMmwVMDFlTygemNPjj3a7xpRb+PkIDJ1EhA26AkCp/I80zZY5sUh0Dqfq4S99RuSH5
         P8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130246; x=1779735046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/SPZpX2kxTAUi5Y+kkH45w7LW+kUEovdQcoR2rE+ic=;
        b=rR12vG9q09BNei3HDS1Qm5/rKOwvRqSLJjBgG4Yakrytvizlg7Bs0E3TTvQXXaTR2f
         +cMLbBLT3LLmiLHrvvodx8kqcpj03xfCCWM1XubYZlnCSHjI2PDMhKUpK/SkB6JvjUnv
         lCzSZavHnhsSC+4/g01Qltt53TcPkDiOtEIkzQ//8Pyh3ytkKx8ZFHKIaUCRewEiejrj
         p6mnDj3Te8g+fQhUMmYOpI+5iUnlQXiUUHPP5OqugE0idJ9OCH6jyIiUsIyf8LdWmYQH
         wNNJvAjQ6Ulz/4m/W+xDw4/vKrqR91PwA9m0F9aqfvwHrS/I6/SdIXijwvkiOnkkXHrZ
         WmRA==
X-Forwarded-Encrypted: i=1; AFNElJ9koasQI/aFKZtXcqPnXM/0iWsHYlsqWwLTCSWm+6vJuopW+MOFX1VPpS+PcORtYnY+YCg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCyMse4iBeWWkvqvQdyiqZMK3h9aUVH41k+wAxHf/GPuFAq1dJ
	uTXZy4iz6hltxzMgzGCZPOHvfOyZzBKyazRVvazipSzIY5riiuPlK5vcnAUjtBJDOYzWaQW8t31
	Dvj39uaY8EpuPI7EFOA8n0ekcicCAASpH5LAHhW6eGMZZxgQmU5YtUXc=
X-Gm-Gg: Acq92OEWXTiaan8nzbgum6+pxk0e3SMxw1gronbd6Khx4Z5+WNf7vJUXG2kQ5FCXid5
	abt9MHB29hEMcr0WqNmGVxMo86n0/EhUdAY0sQZKpauRSscwhn52eQf5Aw1NGnQSpBoXGmI7M3D
	H48irfQhiEYLCeUHseRh3KQAtD84YmgEWLi7qw7rKR5Wj1a+p4nld4HMzX9K+GsiINhGQFZWI5l
	1SCe5vPJnkxT+ql/SRMcNzCH+D7/eKx7WkkOzVh/QHCkhMCkW0Oxn297YfZjktZT0HjclHzhBYi
	zrmHNPG3fjfvx1NiA/tuRtncA1BSwypw7V3F1CONbfqEfrKXjknlu8MJrr+5vMA6vuQdeV2bWvL
	GdrEKErdFeXirgEyUognEWs/1iP32XORfJjMWq1cPeWDuChAZpDmkDJ6ebuUEJyoGZoIk4FBBR1
	MmK7cL/UMJ
X-Received: by 2002:ac8:5c92:0:b0:50b:4755:94b9 with SMTP id d75a77b69052e-5165a2963e5mr226585441cf.56.1779130246593;
        Mon, 18 May 2026 11:50:46 -0700 (PDT)
X-Received: by 2002:ac8:5c92:0:b0:50b:4755:94b9 with SMTP id d75a77b69052e-5165a2963e5mr226584941cf.56.1779130246116;
        Mon, 18 May 2026 11:50:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9? ([2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm36447611f8f.11.2026.05.18.11.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 11:50:45 -0700 (PDT)
Message-ID: <e748de00-f2d8-4daa-8716-629e7c683911@oss.qualcomm.com>
Date: Mon, 18 May 2026 20:50:44 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Update the thermal support for imx93
To: Jacky Bai <ping.bai@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Frank Li <Frank.Li@nxp.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Alice Guo <alice.guo@nxp.com>
References: <20260430-imx93_tmu-v6-0-485459d7b54f@nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260430-imx93_tmu-v6-0-485459d7b54f@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9Xx4OV1KiqBeZ7Vw3rMBR9wT7WDBkz0h
X-Proofpoint-ORIG-GUID: 9Xx4OV1KiqBeZ7Vw3rMBR9wT7WDBkz0h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4NSBTYWx0ZWRfXxocyhFF/LxFf
 +hYdmCZrxkfR3LxHds7POigGYvN+gbmniNDOgBKSlYg7g+/Lv+3tdo9ATBKmZtQCcUSMRH/Mnaz
 qXfv8OcEYJR54S/Rmoa58bJkvz2pNocbGwJIFbAp7Rd+NskYMEhjgYzR+fdy8pi0ofdtz/0ad7t
 hGWT8Z55L8AeWq/s/QZx2f5kAYxEqI9ITkEfT3o5qZgkkZ3EqmsQKzDh6RvcxReKlDVpT/ki3S5
 yeVovgn4ai63YpTY0q2GcCRqDn9BPgjeRLL5JTQKcXgIa0WkqI6tLDKLAO10ilz1nZiTKmY2afY
 uezvxlhu44GGTuX3zb0W8mkbEbtkoTgaQw8Eblzxx47o+3YCB3FXkiH1PDDDMChJ+bSOa3XbTJz
 Cl5t0O7CeH/bHWYQ8ZKQB4sVkdeIEYeXwTz5Iez1fj6t2MARRIXrkFiuDRa1y9DkBouY3xtmPD8
 q4WxlQFP4PfYTvkHVBQ==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0b5f87 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=8AirrxEcAAAA:8 a=IGtpPHPLznOUk2rqc38A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180185

On 4/30/26 04:53, Jacky Bai wrote:
> The TMU (Thermal Monitoring Unit) on the i.MX93 requires specific
> configurations and workarounds that differ from previous implementations.
> So, using the 'fsl,qoriq-tmu' compatible string is not appropriate.
> To address this, a dedicated compatible string and corresponding driver
> changes need to be introduced to properly support the i.MX93 TMU.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
> Changes in v6:
> - Drop the unnecessary local variable
> - Drop the first errata check in get_temp function
> - Link to v5: https://lore.kernel.org/r/20260421-imx93_tmu-v5-0-05ea1969bb9f@nxp.com
> 
> Changes in v5:
> - Drop the unnecessary macro defines in patch 2/3
> - Add the drvdata info for each of the platform as suggested by Daniel
> - Link to v4: https://lore.kernel.org/r/20250821-imx93_tmu-v4-0-6cf5688bf016@nxp.com
> 
> Changes in v4:
> - Include bitfield.h to fix the build error for RISC-V
> - Use macro to define temp rate threshold related settings
> - Link to v3: https://lore.kernel.org/r/20250818-imx93_tmu-v3-0-35f79a86c072@nxp.com
> 
> ---

Applied patches 1,2 & 3

Thanks

