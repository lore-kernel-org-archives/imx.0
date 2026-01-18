Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8119322B8C5
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759507; cv=none; b=iXe1WwCZHWzVOnCrqBbHkrF4B8fLeMuqdq/bjgacBJz0rkoFqgEpBHMempQixpEPnexXcZiwjEj2kLJCiYHHQpXR+VPXcRVJmfIL6uxdzjgQc7xJA5fkkwt5i697hZIrnUVb26NxMwkwNYFXuvlZ7gxuQDVPP0jkpkuiQ3ZWFjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759507; c=relaxed/simple;
	bh=Xs1SEo7FTHJjNKqwYr1uR66mT//ADDcXwteCdd8Pmjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mPZfxaFiSbfEW4FNifEXX+DwSIXjS2TGQ4Sot7jNumyEI+3vmOJxvNke+SlrbnVL56AzRXaNE5lnUfaKW02WKBakybOj5QEX0HQ3obqT2tsiY9jA80O4df14m3xVEs0gZ9ZbRYIvqASDNSLZwQjbKt3Nz3fuMG814OS07Vg4UUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1+qbaBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E8KbHUJq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1+qbaBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E8KbHUJq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IDe7xl3281269
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 18:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pP3z5dAZQekFVGwYrRijf6qQwez1pioEdAikADgTPEk=; b=W1+qbaBRmXE9Cktv
	oIMVm0EvrSx1OwTy9S8AmbkQ8ZCbNC2JsvV4fRY5HcqHoGmS5JsGL047uY9gotDT
	Ws2kTx1wLW4IV4GwhOIAcUT3bpfWR5GO455GjDAbu+CsALXt+rytZr43sFJxFJjT
	B2Cs7nJ2Udp3h0GbEsW/vziOAlDunoK4FaWzs0dn8VYfWkrJ7fIZLSykV9cibHs4
	arMrFhBl58HtxRTeTqCgy2No/kV5PmgMVLj1LP1QVrL5Y2ucWuslpGP9V28ThWZT
	71s3nBYv4+tc+L5fp/wYwWV7Vd0GabVAdNMVBrnvRQxZRxz6xASeZb8qO3Z4imqo
	GU6zuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2gujttr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 18:05:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5311864d9so795325085a.2
        for <imx@lists.linux.dev>; Sun, 18 Jan 2026 10:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759505; x=1769364305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pP3z5dAZQekFVGwYrRijf6qQwez1pioEdAikADgTPEk=;
        b=E8KbHUJq/qFKmzf/dZ45wrZSqUQkP87dVAcyef+sYpsbDCFjmWs8rRygdn2wm3Y+W6
         iEqw5qUPqrCelUlYwPkpJ8am8vWGDlgQEEqHTnK5vGjHPAPJzNAuVVNnbmjDkgjqiQzA
         wxkEQAMg5rmkKTCD0a4pnaWjKvnBC3E3xpg2+j4ats9Ekgna/3evHWexkkV0OdvLGnHs
         Ao1jPPbhNV+wjXH+WxfhNNiLCiRjqqWIGXp8qD8zR1pnF9bBp2NyQ6INy5iZZFSurHxC
         z0Y+ZFn9DZKr/h8GqbuVjvBNi14PQxO9SndBxddXflFakNxJ0vc8NngkdpD0IH5uWG22
         wRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759505; x=1769364305;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pP3z5dAZQekFVGwYrRijf6qQwez1pioEdAikADgTPEk=;
        b=KKg3t75dAsnRsJ3aJCjM8BOp5pRzKVAhVJcvIqilqB8T5U0sxT+gtW7yxOiH7ydJ18
         lpxWbjuDV0aXsLuM7gyXCD41sp0C+dIu2CeCU2QmbFhN8qWLZcjt6G+6GqowgRr6cWtr
         Qi8N2zKkYDzfzInza9MdQvSqqtRoRQuG5ge6CxXWEH7JWltvXCG6/EH/KDB24YqqhZj/
         UcuoF33hp0CyVESwXzzUSvCRjAu65lvnXr0uIHUAByprNjAZG3PahTMwNXiYel52U8Dh
         D0teEiSDaLML5yXcyjnRftW17T+5fVfvrP4PJvyZyI7qth67+Hu33FLm7gNJpvKTcz6Y
         71jw==
X-Forwarded-Encrypted: i=1; AJvYcCUfOGWbRHfKGaXPoI/xjmppn4ldR/2FJSIYTOqNZwMkL0IIRNw9n/pAHc6R/LzDTgqrDR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFMQFDs5A7WjsA9zGWQpQTx1RBj/UNL3zNO5MjRURRXI15PWz7
	5eUkvXZEb5Qw2SG88bCU1+Z4MS8SALaElFbnhcXtFTv2A/LGDloebuqBEqzYpacCaJYUcVuz1VA
	pfUauaSIYwJa9Ejpxrxw82jmlXqqJ4a+JW/8qKomCOSL1bYiNCMdY0l0=
X-Gm-Gg: AY/fxX7aky9EsDPmpFHv2EiyAwV3ctDw5lCw8VqI055uHQVP6FndOwKeTsCbidjPMf3
	um+avE4bwsnUr1yxjcTCy2UnzdDl4cCPvGonk1YXrmBuvkYHDgXooE70QiGwg13fWHDCxXhwNFF
	qAuyFQUwW4pIoqIigMD1Jy38F0d6eazm3QKG5eRjGcdxsHxSs6+93dd1P7SoBNoEvYvjaWT2f+J
	riUWaKuxVedIwLAB2WRgG08w046yyMYl1xEl5AlBJM3ezoTagc2eGiulMX9XHPaLQ8w9MyTyNl2
	W/atNk1ASwSw6Xe97FIoLsc4rLlH4nOp0x4ly9PMPXh+B6DF2+BojjaJKAp+yPh/oImb8QUoOEq
	QXuzQ6NenOcJWCQ8Rew==
X-Received: by 2002:a05:620a:1a92:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c6a6789994mr1324354085a.61.1768759504585;
        Sun, 18 Jan 2026 10:05:04 -0800 (PST)
X-Received: by 2002:a05:620a:1a92:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c6a6789994mr1324348485a.61.1768759503901;
        Sun, 18 Jan 2026 10:05:03 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9fbbsm895290366b.38.2026.01.18.10.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:05:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Primoz Fiser <primoz.fiser@norik.com>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
Subject: Re: [PATCH v3 0/2] Add more PLL frequencies to i.MX FRACN GPLL
Message-Id: <176875950215.776971.6809475873129036487.b4-ty@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 20:05:02 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OCBTYWx0ZWRfXxMIZ4fw0uoju
 YnRJjAUwyEOdf/BZRIIwzkqwO59LrhWV6TPGTyZ5yVdIgJ+K0jKqcU7sOqioE9bklSPxnnFBD5n
 Cn4XwoiDWhoXklfWhxpfRs0ekNfoqGsZTrc+9l7XPH9ru3LKGE4FPRUFvTZcOTa+4MAgROYjfbp
 /Mbok5ps6fcVtR4p78JJTyzEnXGtK52f9IgKhjQ/eScOFlQ6oGd4yuMKPS3vxHxac2M55tIfjY5
 tBj3hKSWJZYzyvMGMoQQ3vzwQeU2vhj8nlpMzBnRHgOQrs2jdWgotC6J9CSg0gf9f4jaSwxoQqE
 +fV4K0aTG8UyDJTQOBp8sLGhXFPUe9Gh29UjScH9P2bjX4uyVyC/C1PB1yvuT1IGcLp6nsaXeBH
 TqVyRpRsd9/LMQrekZ/7gEGAIuv63Pb/lt3vz5owTP8s8dchRECvaCh99RpCDhba28NJT8MM3tO
 NlD6nOqJLNuAw+Kgu6Q==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696d20d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jAkwa8wCkOQO9wpXspwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MW71uQeyQl1Fw5dLXUc-C-MVd6h8HjT1
X-Proofpoint-ORIG-GUID: MW71uQeyQl1Fw5dLXUc-C-MVd6h8HjT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180158


On Tue, 13 Jan 2026 15:52:40 +0100, Marco Felsch wrote:
> this adds two new PLL frequencies for the i.MX FRACN GPLL.
> 
> Patch-1 was previously part of [1]. The new version of [1] will drop the
> the patch which is now part of this patchset.
> 
> [1] https://lore.kernel.org/all/20251202-v6-18-topic-imx93-phyboard-segin-av-02-display-v1-0-9c14be6c7478@pengutronix.de/
> 
> [...]

Applied, thanks!

[1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
      commit: 9bb910b049402b7a3496250c9c6ab169aed83d15
[2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
      commit: 3e6b0227b93c708e93e33f6c3485bad077650766

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

