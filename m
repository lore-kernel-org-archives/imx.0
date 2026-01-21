Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B591F368285
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988412; cv=none; b=icC1fXgSv3IWmjKU9WjU2lcR8JJkNqO9qHYMyyvpt+085tVlnIoOC+mncel3mpFVgn0nwwcaedPYZ6K/cPXOt+Cg2NEJh1IwoZGJqlvBnb9C64cYF9nEVsTtb1lViwiTcbwEcNkeaNTlrrzcakp7IEcP4iPIolcY44P0NFm0sKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988412; c=relaxed/simple;
	bh=RqhWWU78eavUc+/hce5nNHYpseqeri4dhGKCpoqACT8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cWofA3J0N3yKU510F+MObm1Lf9etCueZzMU3Dl6dQko2x1w4LZI6dT1jaDCnl+/xJLp2PQAokv3XEWl3+xDrSUlZ1cr3hFD/QQ9BmlYh6ouaArT2O6nuzR4OyewqBJlOLKQmPVugtu41EGp+/oSEZoX9poKzT5Lkozi/Fkoi9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1ssyxIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AG/tqqs4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1ssyxIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AG/tqqs4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L6X66m2353958
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 09:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4Ehy94Fv1ZXg3yukgsvhncVRxUO7ynPwWFfhST7HNw=; b=P1ssyxIfhRn/9CAw
	aSS+XClsUJsN2UoudxSo5YYR31epKp8cajWoKDFzAR/s7m/LCGj0uFA+lIbTsYJw
	8z0WnbxxKzEizba4R6P1CbtspKZPkFH8GF3PhPvWSfMeHQD1+Z1cNe2YcS6nE1re
	HwQYuH/hHYU+YR7mLG2kc8SmX1ef3DcQekSbHS9rLPJ0usYmBWf029coslnVtp/a
	KpAvqBV3RmMPqSzZyncFYw0rQZnZDlYwZ6w8mrf8p0599JNs+wePNydlu0hhjKAF
	k/JyZvWwBAcCgxVhj3OCXwNCLjOILoUu9svJtgE4gK9CgOt5hclI/vQ9FtMM2Osx
	H2RSWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btsmprqqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 09:40:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34cc8bf226cso6388481a91.3
        for <imx@lists.linux.dev>; Wed, 21 Jan 2026 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768988409; x=1769593209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4Ehy94Fv1ZXg3yukgsvhncVRxUO7ynPwWFfhST7HNw=;
        b=AG/tqqs4liyP2H/MihhVytGdMo2k2utHuntyLVDUywIemLBXFtQjUIVWIWx+wjCtLh
         JSiaX1D00CwtxSsZcgngY7I+ktWTcEgO5BnFN1ne7hkrDqiwoR0RQwazehmmsFCwo27/
         6v7TnkGn8zA6z6zZPz8dZQVVfSJCzUdu6qMXfKrYAE31zHlvkbzXUzVYOECjqD95Cxv5
         Zkj9clzwSRW/MU+LPdm5F7Bzq52jSB6V8uuOiMmQIwIp4rX3FT4/qmDPzzxg9zQVPRV+
         q/TCsYtWApgvJNqVVUeCeMmHQDULrnQ/XEX9GW+NrNaT5s7Urlqk/Q31yI3EzIz1E93w
         IYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988409; x=1769593209;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J4Ehy94Fv1ZXg3yukgsvhncVRxUO7ynPwWFfhST7HNw=;
        b=Jqqp2jRHVXxKPPtwaeJkXxsuzkc+UOdMVMMhsbpOwONz3zX31fgTk+wo3o2N9MC5j3
         HwxKb6Cq3afYpP08017SoZNGeUKNIVYRL5Be1hYPvdDBGtezP1kRTYpmvkpI7TFPZ8Ef
         gCR7iGyEfRoUgJMCPKAafxqMBr8NL6l+pZ8TZkIyIyZcuPLdGqIB192VA6X0JGICLQnH
         cqKRdGdh1V6WV3/VrDB9HSd4V+qVL5yCeu1K/64AUgqt01lk5nAxrVZfjnVmCzWhPRgs
         W7ziKQKBf3QbBCLevV8rsDGh2ruJ+r4nc3CaSG0b+VgzWyvJXe0MeTlVw0CPm8yvb+lr
         NYlw==
X-Forwarded-Encrypted: i=1; AJvYcCWVI4Ctgv7tyOhBuQ0BjVEBHycyZ+G61F4b8d9/lzZMT9K/6mckCP1dPy2MJu2Z8JbVdHg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3TjKMkVvQ7QdEtdG/jQ8qAWsLyIvsuBF03WsL9iZL72uHtb2T
	A/FfCg3JPdthJkeT7XTFzSQ7xbK+JPaZe9lwnoYclJcKsjIyo9sOtlC5SN92fhTm3wHrfWk95Zp
	jcA1hOgYfFcOuxLt70Nr3XQhmZdnqhf4Uw4jFwUEwKSm3a7B8KK0ccBQ=
X-Gm-Gg: AZuq6aKRjBCWsRcAq1Y3iUCQtr+jCRvle6XaXl4QrLwNXQiic6LQqEF3dZrvwLwA2rb
	s32xquo4q7uBKntKg3accVnt/BTmqssVPBOba6PEoRlKiabeHuVgZdOzsLeMkJpGOBV6FdP37Ab
	vBoIqZyVoyNCZMxUNeyel8RcHKlJJr7sMCoh8d4EokOOPERGc3sDiruqbW/Hn+zreYph9aZzxHq
	DvbbmBJfiiuYXSDIjTaW8i8UqHd+4xlgxkPFVnPAV6DLFODHJK11oSb8faXR0Bxq2w8cuis3VG2
	8muTPNlWzKtbr0twxdZWe43L3Gt+n9NHhSzQGZ0LAZR13qsSo1K2zfc/uYf08O0mNmcZdC/O/tz
	YON1GE6bU
X-Received: by 2002:a17:90b:278f:b0:349:19a8:e00e with SMTP id 98e67ed59e1d1-35272fbf464mr13490496a91.31.1768988408454;
        Wed, 21 Jan 2026 01:40:08 -0800 (PST)
X-Received: by 2002:a17:90b:278f:b0:349:19a8:e00e with SMTP id 98e67ed59e1d1-35272fbf464mr13490478a91.31.1768988407894;
        Wed, 21 Jan 2026 01:40:07 -0800 (PST)
Received: from [192.168.1.102] ([120.56.201.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352fafdcbfasm828673a91.2.2026.01.21.01.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:40:07 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de,
        lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260114083300.3689672-1-hongxing.zhu@nxp.com>
References: <20260114083300.3689672-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v9 0/1] Add quirks to proceed PME handshake in DWC PM
Message-Id: <176898840193.11172.8990003270800077738.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 15:10:01 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EIcLElZC c=1 sm=1 tr=0 ts=69709ef9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=o3iIPP6MwdQAWb28Nvg98Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=4S7PnLgJINE9Ke9AXOUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: wCLxhEtAgZqeCx_EYTEh_p-1Lomnb2aw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA4MCBTYWx0ZWRfXzIDkjjI3yqsD
 MtsxUsInOr1PbuhFILrZlwgDGOzKl3kwZGw2ZSbF1mv7TOgBa5JR4dVKWQz1eAxYE4QobfV3yIS
 eY7wGVjMtHHrGctD6I/TCbrkY6ubX+py210hlTt0s2j8Orb/ZVODWUPbA+5REvEZyRn2nq70s8k
 hOKGWNX4sJL2XiFa5wHECWLWc9zK2OWAq0z/Wm+iE9Ocw+26mS1dLcOooeqNknPtjbYTm9UktZP
 xDstJwYrcqdA8R9awAO/ZXfcV8AE+RAz+8bfrJf/bI3kpe/eZZ1svNl/hMa0YE05NghjoPIHV6e
 IQbKBTjOcyM1PL966HR1Jb16twzgd3BoGQq/rh+pXWC9d2jCXbKnCyDIn5Yu8wPADRUdOILdeKI
 Nu/x8B/Fk2ol6Imqmwh5Cm/XInaSYWawZlSWJSY5bT41JimO64MCDM+4KRFneGemT2HXjiZRqYw
 uFwCmYE0EhIDXY59eCA==
X-Proofpoint-GUID: wCLxhEtAgZqeCx_EYTEh_p-1Lomnb2aw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210080


On Wed, 14 Jan 2026 16:32:59 +0800, Richard Zhu wrote:
> It's harmless to let dw_pcie_suspend_noirq() proceed suspend after the
> PME_Turn_Off is sent out, whatever the LTSSM state is in L2 or L3 after
> a recommended 10ms max wait refer to PCIe r6.0, sec 5.3.3.2.1 PME
> Synchronization.
> 
> The LTSSM states of i.MX6QP PCIe is inaccessible after the PME_Turn_Off
> is kicked off. To handle this case, don't poll L2 state and add one max
> 10ms delay if the skip_l23_wait flag is true in suspend.
> 
> [...]

Applied, thanks!

[1/1] PCI: dwc: Don't poll L2 if skip_l23_wait is true
      commit: 58a17b2647ba5aac47e3ffafd0a9b92bf4a9bcbe

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

