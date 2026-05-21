Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBCC13DDAE
	for <imx@lists.linux.dev>; Thu, 21 May 2026 07:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349217; cv=none; b=WJDk937oi3vYmTp5OR12XExsdtcdIBS/FHvWRjBmAV9p2yOGkLFhKc60bIjHyIiBwPjSK0WZXXJcwnJol6mVTHv7ntvM5yJ/l7BNtYKHC5o4I64smZ06r5zr+wxuq8ZFYZHaj8JT9btVnwW3g4gkFrh0mm5cjt43mrOX8FXCx6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349217; c=relaxed/simple;
	bh=mnp0hDUMzsfuD8bK3qz6ZH9GHD+w1suz58/r0pz4j0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8Xmkm9DvVNbxbNcZ7plEUy5JIh1iwdeKYexTS87nhLod6DtFMT/4JTajtW7nQkvmHhGdIR5SO3D46P2v2GC0BWNKF/CArjq7HhFiIaDPnjfYtxNahQD0fepRNVYaq0ySzfmPQV0Bkp+T1jdg9BTxC5XqJVqt4cc6O0tCcFGnug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdgJ7aKe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpCEFDhH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdgJ7aKe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpCEFDhH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2T68q3816809
	for <imx@lists.linux.dev>; Thu, 21 May 2026 07:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJVuFDQsF4Iwfpmap+pWFBw4cYfM0g67R2E4BQtznhI=; b=EdgJ7aKe0dbx0o9S
	oswDIcris1MmJIdTlkWGyqwXmEyMm/3+tcV0c8RVBba2keOATX6VY1IK7+RhInKX
	68T0EmvjiVGxca3xv3eZLnruWsOkpD8IaTEebkgqbmb2gJI/DRPlOxka8RpPltRx
	kn8eJOm2v7YhxVfCX/7nVahcBv8XmSQASVDC8Jdk7bun1eBRHu6UII+Q/SfmIIJm
	8tuT2Hf/2AdyVCxdYCK2dUIiLdAFLLUI7zI7M/IyZCV/KH68mC0Z5T9NjJgCdK/m
	g0dbgmfs1x/0/vVsQxUAqDxXjW0K/cZ8PgWFUtvkpejH2LFhWivsL+vAMPCwqp7z
	gqQU3A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa11qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 21 May 2026 07:40:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8354503d9acso7692063b3a.1
        for <imx@lists.linux.dev>; Thu, 21 May 2026 00:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779349214; x=1779954014; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJVuFDQsF4Iwfpmap+pWFBw4cYfM0g67R2E4BQtznhI=;
        b=EpCEFDhHNuueRyoQOYFl7oZoWIA0GjD2jSNWJzPLFQ8ECHfbHDZpFNL0HrxdY5NhMd
         q8EyQS3Jy784YVMRXAfwujZD5p9ZtvkrCSOqdexZsXQRZnyrS7lKiF5mtDZTf2YxgIuR
         XGIslTiYc48ZAgQFsLuLP8uxOHKn+YGqRCaGwpfW3e135gCQNFresiGrt3cKudH80tIy
         fAtB1cIjg/cYHjFHCdsZmDpKZTm0zaMP7rfyNjt6/hPy9bvmC/SS/SkWICX9Ji37VEPr
         wAcLumIpsItVo0Pe02ntZ2ISqHppOWK79boQyl6GAt632Lfbe4Zvqlu6AXjqpacv+Hr6
         9CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349214; x=1779954014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJVuFDQsF4Iwfpmap+pWFBw4cYfM0g67R2E4BQtznhI=;
        b=SAnZ7+zatioL+KqLNc9CGIdmPlDe7SLCdWTX5fXkB0hKRG2u2/mh0JGvlr5OcYmb26
         B08831XFKkKAb8Scwz89/bmDVcati5uBBhoQEh+PCt0wFeEJx7ymvaU7PVJe4gqhhdpO
         2WofxPWZAtQhm5H2BsXs5z5mOgN4gKf3POf0Ju+i2WJmJm+eocSWuuO5gFM5mUbvFxZ9
         DJ6sFN5kvDK7qwaUWzBjjRVrTjRXC7CPXUEUL5/C5uDcl/B/SVAHwQc+7lgwAYcXRya8
         syjW31RHPFvjEm9yPmNuQrruhBl5HMiSc6FrC2FS6P1rh0afHG/FKgeWEdngSE/TJUCG
         6vBw==
X-Forwarded-Encrypted: i=1; AFNElJ/eMePtIdtKxsVPoXwMPFSi7E2Fr3YZXnwZ4FmLOxo3qwJJ2zOk82yEgbCmOCdArNbCzPw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQfHjYG6ztgboSTnYjpTx3C1HyILbnbz5bNGVtJKqB1y5Ru4V1
	7QCnghGM+8chcSDCGNmbM2X9K8KxnUF6ki+rjZa8/E7EKJcpamEMr8Uo9x+69wlj2kog+THwkpZ
	KFLVSaYbvNPcXmP2Q1vLqkGu5FrdzGS7XG69gvmjZVKwdfpgUYQNgQJY=
X-Gm-Gg: Acq92OHZtORzJqGYDQwByG4LRgfjF3Ngtl+v0t1AqF32NFbtaTQid94Tu2Gy20h/wHD
	hYEiKIiCoMv19Xka8MSmHJ285nS51vEo0/nhdenzLMNC+2kpZIv4nBuiwD1ZgzhZcBJfZzW+C+q
	ZpbT3GmPR1Pve4DDwnXxfEs3MSmC/ExreentFHmO6cDAQZbUFb/T9wHle7c4GCpKN7fLNl7HQzT
	Uuzty6iTMlnuObBEiMK/NquwtIWkfH1J4tcv+RaZn5A6YOQEpkQDEuPZh/+9Pyod1WjOu4xcP6E
	11yHHbKCsYRNsd+yrJVx74aE08iUBcvFnyBcwdizU5eGp6D9SRM4nNmPpjZH/Ilcik7Bzx2+S53
	BLkjsnla6zdquWcEyIh/D+F9h+sk41ietTTTchUTGz5mg6VZw61/ihX8m35z4SiaLw40=
X-Received: by 2002:a05:6a00:4006:b0:827:2a07:231d with SMTP id d2e1a72fcca58-8414acdeba9mr2010673b3a.17.1779349214174;
        Thu, 21 May 2026 00:40:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:4006:b0:827:2a07:231d with SMTP id d2e1a72fcca58-8414acdeba9mr2010643b3a.17.1779349213557;
        Thu, 21 May 2026 00:40:13 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e22f1esm477039b3a.47.2026.05.21.00.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:40:13 -0700 (PDT)
Message-ID: <4979e748-ce4e-4244-8906-e22a1e6472e7@oss.qualcomm.com>
Date: Thu, 21 May 2026 13:10:07 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is powered
 down
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>, o.rempel@pengutronix.de,
        kernel@pengutronix.de, andi.shyti@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com,
        haibo.chen@nxp.com
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260520101504.2885873-1-carlos.song@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260520101504.2885873-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA3MyBTYWx0ZWRfX6fTQC4XmcrSq
 zh+DtixyTi+VpPzjgCxXED6V4bGlwkTOITH+Jo37L9WFTYewMwdRR1O+HYYH8DKqqTcPjoZVoii
 hLEOQIeqg46JfirOt6RkYFs/5pvmwkPXOEk4ZX5laE8RaZ6+Zphe7eg8MRJwW6LYipM0v605alZ
 0Vo4aCPHDFwEpysLDoetI5xxrTTspJLdf2Bk16ftzjcWlRZ0Rlt061PnKFbP7eSueHQ1WVEKqtt
 OZhW2ywfzpiEENy7hoNdrzmLzH6BTss07842MP+dHJnLjbZM6yRn34LU/MaYlyGvVFsKKsLQ3ui
 D3Gfrqg7xX2t1DDJNE1cY7TgvqQFTPYtKIimQwuYCkMT8nMykFx0FLWacV8JgHY77FtVoJzDkFW
 R9q3X6Aq1i7dRyd7bEF8M+ENrLqJ+wff3SOc++iTNRmfFVtKG70b2FzQylhZU9DqA3ZxHHCoatE
 ddgz8VijmztFIci0kZA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0eb6df cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=KOk9-1IoVFRPxriqIuUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: VEpeedXQlHKZNJJKK76J2829yKmzDt-3
X-Proofpoint-GUID: VEpeedXQlHKZNJJKK76J2829yKmzDt-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210073

Hi Carlos,

On 5/20/2026 3:45 PM, Carlos Song (OSS) wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Mark the I2C adapter as suspended during system suspend to block further
> transfers, and resume it on system resume. This prevents potential hangs
> when the hardware is powered down but clients still attempt I2C transfers.
> 
Code changes looks fine to me but have comment on commit log.

It seems, you are adding support of _noirq() callbacks to allow 
transfers during suspend/resume noirq phase of PM.

Would it make sense if you can write "Replace system PM callbacks with 
noirq PM callbacks" OR "Allow transfers during _noirq phase of the PM 
ops" instead of "mark I2C adapter when hardware is powered down" ?

> Fixes: 358025ac091e ("i2c: imx: make controller available until system suspend_noirq() and from resume_noirq()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
> Change for v3:
>    - Add hrtimer_cancel in i2c_imx_suspend_noirq to cancel slave_timer for
>      safe suspend in i2c slave mode.
> Change for v2:
>    - Call i2c_mark_adapter_suspended() before pm_runtime_force_suspend()
>      to prevent potential deadlock if a transfer is active during suspend.
>    - Roll back with i2c_mark_adapter_resumed() if pm_runtime_force_suspend()
>      fails.
> ---

[...]

