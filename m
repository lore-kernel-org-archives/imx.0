Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F4C34DB61
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837583; cv=none; b=TStdk+uEOWPG0v7SnTNWDt3dPLsbK2oe6SJtW2aZ8hRSKlUMiHjNBuTUkTD0WXYzLvy7EVqBzhwF6YxeQL2gFL8gd2BNhiVDzU2K7FxKduzt/+cdqv3HYst/taZVN/Ptxrj3LAd9Q7Tgi75xhcjaECBsBQupuB6+V8BJed5DqMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837583; c=relaxed/simple;
	bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jegOgH3QQE4jSZd7rz6iCRGVf357THfHiwtAWwK3lf/vUy6azMPm1BSYnNPtBSRokefJMlaHr2r5Z+fvqiC2+nwjpB8cNZCzB+IEMTmXlIlHenvZqvkR9iL/JWIbllKCbV86C5iG+4XPwZs5pJWmZ18aiumcRp0Vd1s2y7fntWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTPVxryj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJNBs6Nj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTPVxryj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJNBs6Nj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNHlDa2045688
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=; b=YTPVxryj6fttLgGH
	RWiNJnaVeeo8IXYi2a3nlPBXYzOJFg0kJ4HXHffcmY6mZdjVYU2wXAdIsyyQT7tZ
	8WYSYv2AhIedEBKlTyxZkZx9AMvqxdYsCOm/bnt4EeQJAVzW04YL6yvEERQYgjje
	5sP1WZMCbioyRMX1UsmgWRwqmqh2/9alRdwP6EgHoLgWEN7mA8VGIA+Jrh6Ey8fd
	DT9P4qG6PX1QDnvA1EikNyIVJsC6mwmSukurC88Wvv70LsLT//e8TSKTXw3ft+B2
	ilwT1WABBYuJz9NErBcdW9CXPk0vvmJFxJ0UzbnW6o2nnczCoFvlYX2DhECHr4oj
	S7lMlw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav3ch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb390a0c4eso1085215485a.1
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 01:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837580; x=1772442380; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=DJNBs6NjOicxH/qcxt3t/6HSr7KppZ3P2Ji8hbz7zi/D+PntIcsP76bcewwrp5EV/R
         3QjK/x3m04/02t319Y6YMacbKVqoOv6ryzOSy4eLxHl1RqcAFDQGpG8R+ML7G7Rzekhz
         vOHuisS+9/KZhNXzejkGa6DWYt+GS092QH4mqsu7f8T+8PZIKRIIGhC4M27ChDm4fNPw
         zhFY7/3wHA13zvFhvW+GGUXkB/3Elb5GpESDiwAA5AmaqxMPYiNdGZ8juenhaB1V6dBg
         L60pz8Vy6mHVzYwpn3Z2UAdWXkhEAJotdLOJuzpuhui24toeqmq4ieJM6tzptM4pNrCH
         kjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837580; x=1772442380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=UwoLXbZZNW8ZNAkee0zw6Ulrik+xItKJtCzTiP+kZCkJqPGkWCKP8dvaimpHR3GRbb
         ORXaW6DdzeySIB1HZlhJNnV3Ezz5c4PHPzlJ9mGJAnmce4sITjtsljP5V+SwqzPHW29Q
         pxd6xAxyWohu0a9/m3wTJOfnyyG1syKgyVcKw9N5Ctkk+W3Fwi9+DTB+2Sd+7a0kVMp1
         fMFkIy7WKcLeOoiJZCFT1uEOUQmMlTOjb8vXLPI7JbnhIE18rsKdly+7ha7G3NhXpFV1
         4SMVc26bds8x8bZLBDeiwYObkxXCFFXgxcN2MkmkhVsvKwwDPqbpxI/JSPrtdepmK4lE
         ycNA==
X-Forwarded-Encrypted: i=1; AJvYcCWnWm62s2YLsuTa/oGtHEMRISJVarb4DafuQiJ5+4E9S1isX2VuLcwZFdhqabwXRjKmtZE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+sHxiWF04Xedfjx3XRfURAhuxrmZrqljDY8vmVPaEL811iIzE
	8Q+lShUQuxih/lVBF89DgCWnlRgZmUit0fPtu2L4i+l5s0ARNe6d336huelfZ2QxBGINy/T+i37
	N5D/oxD9F12bqLZDuJMJkDAOb8oVzhpZsTxVqP0ujsc2HUd+X362j0Nw=
X-Gm-Gg: AZuq6aLACX0+ByDsI8OpvhLtu3XKz9C3eohEj4qFuUI+5K+WwLOed/4EWm9LNi9Rj8Y
	bHAGbs1tI34y8/zyz+97wQD21ItCocL6foPZugFAE5YRyjR5nfRnSOqVJUBtlNlAKtY4RxmCmL6
	3z/uZyS223OPoxgjrMb9ZJ1Fg2djb6e3Jc7Pqmwo9tVBZmUfV9ACeVO0Wd/gNIdPCgQR0xazy9k
	FoeB/nHv75lWa2Aq2VMtwgl4+H+Wl3g+2i+hj59Ju4XPAFrnvi/tx3yvzgNvAz0FJ3t94wtEzL9
	K+rZhr+rjBbERWrBxqZR2djpMgrdG8nurNv9lLgWyDBi/Mc4lLlIKcDJ71CCI4+wzCInAkJeYIX
	eIltQA+5iNc/9myb19+DXyVrJiMflL9lDjZibuHTyQWDLUHq3Z+kV
X-Received: by 2002:a05:620a:25ca:b0:8cb:4de9:ead6 with SMTP id af79cd13be357-8cb8c9ce53amr927491085a.9.1771837580246;
        Mon, 23 Feb 2026 01:06:20 -0800 (PST)
X-Received: by 2002:a05:620a:25ca:b0:8cb:4de9:ead6 with SMTP id af79cd13be357-8cb8c9ce53amr927486185a.9.1771837579749;
        Mon, 23 Feb 2026 01:06:19 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:50 +0100
Subject: [PATCH v2 04/12] i2c: keba: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-4-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhz+YdThvO4PybZoN12qLIFqH/25wCqSXQIl
 /V5UhW8hg6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYcwAKCRAFnS7L/zaE
 w8dJD/0YvmWe+eKNQUwmdkOprYBJLDEghD/tlQF1HC9Xv+6macIkxtbWrcEVLcC1YJ243xE/5C+
 UIpmp60AWCZqWo+w8Sg8lYN5pAOQQcZm65CMDJpvWozdbA1EytRdrcBoInb8e5uTEavrrf29+Wf
 BVX9PajisY4sE5+0sNKu7exBqfC4HULGo41AauatIP0a+ri/I1Kd0apW/jZP8/2VNPB8v2TfyC+
 JKuYxaUJugMLl4OrdX0hqQz9FoJkmdkpvi+eFS6gitLpS4w4XgKAAt85A/zHy8yK4XW1+DfRusJ
 kAjfugD3rNjo9fL/VdbN5pIUwa0HuVuoAFa17emaUlWCoLXUjNs4FG8iimzHGSx07JZE6EKHYxr
 Sqo+fOHjBA/qRv5lJ93uO+uOpIOynNJj7UtaXzx6D1HtPbDeurHQZSQpbPDXbXjsRvfIln6LS0Q
 RmvC1uIZzDMq+Q60D2DATom3xFU5Eg3dtsF65sjpNoyjKr8LEO6s0KwDRniw76k3jrC9logTkXw
 UORxDy39plvEF6KofdTY5fmgKRZX7hIuQiEeDDI9bJ0TsF8t4Ht3KTcOIL3ZEl8otBABbO0qwRu
 aT9bzvxSM+EpZFt03OTbjKBxsEydh0rM2oV/4dJsfK1LN1m+UXvg7XcHdFmLZrABlXLvqlSi/9B
 2/ZzzTWFpvRviOQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c188d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=op3mqaDViYxnCTu1ZhYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX1AaFGeAqeLbO
 CZF5i6ftfUqvgY5oJh9eY0Y42fMICKBBf5QTII+b8esvyvAuuJ78uQiY4M22Lc86r9NtOzcjn8E
 Wm7h4JIh/Iz2tjIJntaQpF6+34Lf55G1D+YEkDKOm49TNYaLQsVZIrA35SJFOwJdEVM5+cK5Vm/
 8a9pjNiiO//4JKcs6YZV25OjiyrIy+OgNgmpoD1geU7OPXkgmtPWL5oF5SXdU25rA80iqw+kl5S
 GntRu1Et4fwC8UQ2sigi/eZZzwGUV+YZclwayzIntqJLslszdbHZK6H+fDLbdNK7Co31KodfQCX
 ep6/AWxJd6Bdr1YeHb7Hm2uW49Wy9iYELrq8aLBp9KS6V56H5YGNH9osZTCrW10qUM26Y2sarma
 Fk8dMZjmjzVZ1pFMmqbvlWS3NwHSgB1Jz0krOB1KzC98E2fDHm66zVjOn8A5ehF9s4XhaZdJCGJ
 /FruoDpoF1RR3NhJYyw==
X-Proofpoint-ORIG-GUID: S2ABJL1nHEMKKTFDo3piRTYFc3lwxcoh
X-Proofpoint-GUID: S2ABJL1nHEMKKTFDo3piRTYFc3lwxcoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230081

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-keba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-keba.c b/drivers/i2c/busses/i2c-keba.c
index 9420c8b342b573da435eeef5a05efde35d61434d..01aa5dd9638dac38dd92500cc8890feb8020754c 100644
--- a/drivers/i2c/busses/i2c-keba.c
+++ b/drivers/i2c/busses/i2c-keba.c
@@ -532,7 +532,7 @@ static int ki2c_probe(struct auxiliary_device *auxdev,
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_HWMON;
 	adap->algo = &ki2c_algo;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 
 	i2c_set_adapdata(adap, ki2c);
 

-- 
2.47.3

