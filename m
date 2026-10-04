Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D836B4519A2
	for <imx@lists.linux.dev>; Sun,  4 Oct 2026 14:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124031; cv=none; b=mWLKqQiPBT1F/AM/wL2WkUWzGtX6hkkx/NqvkEh6vJj1T9f3txlt4c4hmXLejHf1yL5olLydwSPG7KzGUCqmzQXfkYy/K8rT6zrVXNNrsZlPzyM5e013NuuiiX5R6Cow/bp/syNwIY+Hxf54F9hSmsAiQYmVBUU3kcZFdCQcQ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124031; c=relaxed/simple;
	bh=xqXUT9Xa+GEj8rLZCfaBFwCA5jXjiK1BtEgtQ/jOS+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UY01tiA4goqMPLAtpLGaSyQ9fpRp5RKw3iQlchxWzS234IPl0XoJ4R7/KDxm3NUCCazn61itNjao5nU7YQBgCMUZGOBBdhbGgpQ91Da7pihMBerYjAqgReY8yGykgH4oWxE/wToiiLwRBhFpATVaD/KWlgKmqG35WSfDZjEP9HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VF9mydKJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHGT1xex; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VF9mydKJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHGT1xex"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694BOi973028266
	for <imx@lists.linux.dev>; Sun, 4 Oct 2026 14:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oxw95l5hoxhBVXSuBzc7Xxhxlw+esRQgJ3Hwhl+53ag=; b=VF9mydKJNDjM7Ltb
	GsvhpgkBzq2YkTJrkWEoj8Csh26ebR0KQbmo0fDeIHptdoTrFxxNRWogqdZ7Elai
	JZeTU0P1650q5cSW1kIgjcZhLJPEMucWMFhWiV6iVQV7dsfPQ6yySDEYiXbp9qrT
	DokSfgOqZd/4SxTPkOTc6sHCI3AfRGS+S80vUpVyePrmyI7a3LVfBEkcE+N3L+58
	OyBV4zFhtnGoXEBnoBCPmotuhufoJmCTbd1rev0tfp8ve/WhIpQ3SEYDXIgcxFvC
	NUXd4PLGZD1CH63a9D7ZFHlpJU+S5GHD52v+UhtSMZEDd1RpvYG/rIgsk/E1Gohi
	+B4hOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssub698-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 04 Oct 2026 14:27:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so98515285a.0
        for <imx@lists.linux.dev>; Sun, 04 Oct 2026 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791124028; x=1791728828; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oxw95l5hoxhBVXSuBzc7Xxhxlw+esRQgJ3Hwhl+53ag=;
        b=YHGT1xex1z4InHrgsZ7PyEOoq1/H4HIVwRQ3jqqWhanlpUK+XMJJOkj6kVWyyVVWol
         4Z60ajTNJaXkzchdhUo6Huu+WEjT7h30ywS8aLrU1H01CAZNEhtPF5fEOW3jcg8/qGNh
         mvR/zKXvm8QbhlSA9azak+w+vsTkR+JRdvVx//P6u2EK3vtsd2lgtu67x03UPtH4QSm2
         Kl2PlNNlLSztQbjEri6ROyG7wonFmHcWa8mpnpPP9Q+AA79T+r0LvyE02w3ahWwpMFoJ
         puehr1mSbrLWYlPMo2hQ2eKjgpaeiQytOxn66TmRImJZOEwrZQ1jWlf1dtR4iVyL1z4o
         1Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124028; x=1791728828;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oxw95l5hoxhBVXSuBzc7Xxhxlw+esRQgJ3Hwhl+53ag=;
        b=r/U+CRVo1GOJst+e4gFqs92Yjb2rhEoYmqsI6vvHAHNhXE55sxfUKVGSuAec9Ybsyy
         duH3aci5nYYyS/YgFVbB4obl2afNc8JRh1WHP4DnA27hrFv19+tNnN8b9lQWqoP0uoXj
         Z5YB/MnB6J62M36yNhsWMAPxQewp2sTvY3QnJ8z+wf2t+rjUBebMmHudvGb2I4P8CU7F
         GKC7E6BvZ4Wpae1Jb1XLc8xUJ/EcuSipYcDWMhYKrAIG0scPgfDK04QuhDPMTasMqr6f
         U42Ux0g/yaP+DkcJIOUkmtAsiRoeEdkBOnBLE0FnEw+L9fnz5InTEIRDStll1mK64z3h
         0cEw==
X-Forwarded-Encrypted: i=1; AKwUvBwVGaXqKzbZF8HxqStu6gGoWkUPFmSIZDCX6Ypg0ZCRPdcNFGjVG8verZMC7J7fhGzT3HY=@lists.linux.dev
X-Gm-Message-State: AFuF++l7SiIpiYYwZp1/oiVhupm6mlRTbpJRmT8DSWN2IRWrQXcjSeAh
	url92oaPwt44oLljTwmXePosiw8G/XLB+v5zSveV8mIvOJtBhCTRleS9NJTXr9cHfWTKginSPeJ
	R5rbqPUrtnQHWxE7s6vPxJqt1e6XhlDmmmDRIw6K+la/KfQ+zhrxZ8Ao=
X-Gm-Gg: AYBFou2DaiPVs99EOkHMVdIZLok6MvnfBfQBbArRRkLm/Vw480Od3iCwE2i+TG9umJ6
	j1LCiNmTHxhojOm3yYUdELw+KBRWvCPpz4k8VomL7kWH0tR/436L+prii+uQcgQr83JIa2dPoS2
	j/02cVNT2j6YLdcLM6m7j9As0qPFpNdGTjv7rproiNsemLAnRBxgOuV7Ez0BrT8a2ZA3esoMusn
	TUsHwEkR4Fc4Ywo8JqTHIeIZuVCD7gdtoy+6qFxNBEcan8s/5LWA9VG7rWporkFwyqM/nF459wK
	F4UrizCNDmZnsA6GeXEcgw90ohs7zRpizEUlV45tf70VLmtUNTX65aPB1Xv3VLQREUhlXmxdTnN
	rnz5OJ8VNEbSJMnwRr2gsNw93Grk=
X-Received: by 2002:a05:620a:40d2:b0:93b:d7a2:dd2a with SMTP id af79cd13be357-93e510f55edmr903604485a.58.1791124027553;
        Sun, 04 Oct 2026 07:27:07 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93b:d7a2:dd2a with SMTP id af79cd13be357-93e510f55edmr903599185a.58.1791124026887;
        Sun, 04 Oct 2026 07:27:06 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382fe9cesm19762423f8f.42.2026.10.04.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:27:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Linkai Gong <gonglinkai@kylinos.cn>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] clk: imx: composite-93: return timeout from gate enable
Date: Sun,  4 Oct 2026 17:24:38 +0300
Message-ID: <179112375688.706128.17500624983866321148.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260907022214.1076402-1-gonglinkai@kylinos.cn>
References: <20260907022214.1076402-1-gonglinkai@kylinos.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA1NyBTYWx0ZWRfX2DA+spxD4Z5m
 SU29euhkc2lcZ5hN1DgSnji3FnbmIZJQHatyS+Gep90jJsW9sFlPJTPpj1iyiXYVMlMKytL9v+K
 2nugD+vmSd1u+hG/C2wA29/NTiW06TQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA1NyBTYWx0ZWRfXx2x7CUz44GIR
 8VYERorOpwwvYZTzDQ9AtCxhimETy8l4vvSGToz7LhC9QTCsQwY9b9nylUczbZZT+N6QemR2nCd
 4d4tU5GqUagVcglaOib1X0Y1I93xeCvYD8oOGRAdnJz25iQZKRmgR5uQZdv3uAhZwJddElfyPpt
 i5slWPZ8D7J848S87slZZs2LfOUqhJSHpiJJG5BmfJWrkYY6qHRBKBDv020CZJP6oifO3HN/WUq
 Lo16eR3pCnoWWsQz+24Mr3i3qyjBgpPBmuDZezjQgo8Aq565yT05YoU6j1Zk/ad65PScf4HWN6O
 Czo3eb/DeKJu/H3fFdHR4IuLt9L3t5qbJhoIFyuW13fI8RidlYH0wzoCKweSxRdeN/JofjAHQ0P
 3Vwc/ScMLqKrhjkirRWP0mTkxYcDfZ7JDdtefu5EPomRCLLAVGzTr9ZR9Ht/9JaHBpO7CjCJXeB
 cilYrs7s2EJ5KyNjuaQ==
X-Proofpoint-GUID: 2K21mycZp7BBykGJZOhHQJyvBVO2NTJD
X-Proofpoint-ORIG-GUID: 2K21mycZp7BBykGJZOhHQJyvBVO2NTJD
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac2623c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=H-tvq9QLil3GluE5DRAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040057


On Mon, 07 Sep 2026 10:22:14 +0800, Linkai Gong wrote:
> imx93_clk_composite_wait_ready() already reports a busy timeout, but
> imx93_clk_composite_gate_enable() ignores that and always returns 0.
> The clk framework then marks the clock enabled and lets consumers run
> while the CCM slice is still busy.
> 
> Propagate the timeout so enable fails instead of looking successful.
> 
> [...]

Applied, thanks!

[1/1] clk: imx: composite-93: return timeout from gate enable
      commit: 246d9fa6b83d2d3c524aad28de1ab5db5cecf048

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
