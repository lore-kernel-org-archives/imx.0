Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8F731A571
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144568; cv=none; b=nbBA0rtckbaebmNs/AaCbwDuJlNrrpVmZZFeYqsg3SEk0n36uHtSEBz/9aFgJyuNxHGyK1QQarpvvd+Z/Ig18B2i+wJiKDWZ3SCSACfZKp0xf5Iq7hkQ0+rPEKq5cQBgzNxVAhHhvX8mR/7TnQEAvlbaECCsKNZdSF47W3Fu1yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144568; c=relaxed/simple;
	bh=UaHO7/eOvI9UQifWvLpwmCqdh2eotyE0wYd3BHrZ6yo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X6BYYmn9dkMZFSWd/ArIB18B1MPZua5OMcOzKWh4YTfdfdbEqxQgR3g3e1Clp+u6tBzm3sqaUmwJcIY48G+XaZ+Idn0Npd1rcYBCbZETw67XDNeHtbZ7r+F/3kegjCRqBrqZYECdIZRjZJxa8MdX/3PouTYFWUI44wt0Q6p/OuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzTHsM0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NhNmuU4b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzTHsM0X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NhNmuU4b"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBRAZI4000205
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 11:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pWp06pWmbjSJvf7fIHkRuG
	NgN8f0S0siEmA5b1mlZsk=; b=RzTHsM0X2eAVgNkpqzV4KcHaBNbRa8NsXlPAxt
	42E1B9C8t4UZ7DRJQSLJNmBT5HoZanJhTGHOxwQKdKRMzjO7VmRpjYny/gJm4cHA
	c/AKbn+yDDxMez/LuoP93x4n/kWRXNYw+w1PiQ0+X1HFdesFVQE2Wd5EQleXpOFi
	P83ccJH61gP+B9P8A93PaamGzq9B+v6Oe7VGpyWSMt9ao2wgvUb17b6whR9repqz
	YeF3uEKa1nOJuHRgSyLVO9IAFAb8fI5BbH0PJuY35JZufcCGQ6O/9N/IXR5huMcc
	PotSODojz7ryMlBtHRIcEZeP3WTb766UV6I2+1UisFqKPLLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29jhnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 11:42:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed782d4c7dso25625351cf.2
        for <imx@lists.linux.dev>; Fri, 19 Dec 2025 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144564; x=1766749364; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pWp06pWmbjSJvf7fIHkRuGNgN8f0S0siEmA5b1mlZsk=;
        b=NhNmuU4bVmixAv4ZpSEMWNd2C8C49GBGgogGqO69ERAJMz8ttDFRofAo4GDNUps5F3
         CYYxwrLUMCn2owsUuvdz5uH57zUg29TUF0ayeb0Uls6hYD3aTtrIgwZaQBHKHdiS7oBY
         0ijpWU7nwwlJUWo8PN8pJt0UrKlGtObR4R+O9g+Falzdn9gycLBlplWz7VGCdZ+A6NUT
         BzagjRVhwUuAW8ZUFM4xtrnMJs26+zSXLCw2ZZ2XozuOgmXro1pT3cdYP+G/GPDVszMl
         kwrOzqCjp22OeA1Vlzi3EYxCHZXnUuzPA12cwNCWukMmcakqQ4m44dhpSvEpUkJ4gM7S
         eAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144564; x=1766749364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWp06pWmbjSJvf7fIHkRuGNgN8f0S0siEmA5b1mlZsk=;
        b=RyvD8jmXaJdFp2Tvh8lNzjbr7JlFGbN1F1D0ajsP5mX7vQSZrbhxdE3VvYNGimDK90
         6J3mgcwzy9SWfTStMBrX4wgC048fqviq0IxNmCqEW5H2+4boZxF/Wa2Out/zZAvBtRxr
         ryjgWLSQ2VQ8aww/my8999rFfKz6PB651oByA+h7pep3rBlIteeegM1x1CI2by6QzUfM
         sY6pLsTE09I17NgrH64N7jg0nrI2svgV8iiLDSVXfWFmPbGZB4YAjkBKrMmFF/FXkOyA
         liDUiBmDdYeh67Ih/B7XOjvo4Xl28zJxfBE4KWHLXJdXg3nZhVDLohXn/Du3OsROxqt+
         hD1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzWkfnSViRH96/crWxHZAjtjr6tdc7sUtqt1WYXwEghLoS7c+OLkxTtCrYugp5do5a3zw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/tdeeebkNhsC5XreueNWNg3FzULQepjJg9PADqNDyTh/en4GM
	jqKYgSnqxIbZW/w2EGFo/NNhgv1Jam8tsZ1+lOWktJZcc4mWU4AjaaqE38uXG8C4iC7PkbNfQYw
	YIS117eTwHlS3z2BT150f1IVaptRWNe1nld23MGpa2Mrp9WhKpzIimTg=
X-Gm-Gg: AY/fxX5K+uwWXG+FA+vLOsYkUrCeCb+gg5JB5Mx/IJ41bONDIJgo4YiXljlTkYnl01f
	66Lmjp1W1HPCtQXMg/KytF3GLS+raKjMwlpbwUIWSm1azJFMjdwZSrdqdfcwJ8HhNdvl8F09Duc
	gLdIcvAikZUQJK7cYV+BYwWj9C3FLqdjqVNOfxsd0eTAC32XFa6oXWeJAKBKaI9DGOiGtgu5xLk
	C5rAo3GjWKBZ/LvoR4jHn5lQnVyHXMaHXOHZ3Lemyoasz6uWYHHkU2htnMG+FTCEcWGlUCwNSPb
	5HImQ6fNl0gCL1Yv05U8H9aYLArHzWprw04i8xjsGTI31/4rwAq7I01F4FactKhSKA1A3NhIcaf
	Dw8RLHN9fD+WhwRzv332UaxDnnBHAUdbp2d5q7x8=
X-Received: by 2002:a05:622a:250c:b0:4ee:24b8:2275 with SMTP id d75a77b69052e-4f4abcf6df2mr32638811cf.1.1766144564335;
        Fri, 19 Dec 2025 03:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmBbFYUgOlr6WN956Einac/qKi2Xml3/A2v+AE7uUKmhMDZRt/gScziSp2QVRxwtyeDwUkJA==
X-Received: by 2002:a05:622a:250c:b0:4ee:24b8:2275 with SMTP id d75a77b69052e-4f4abcf6df2mr32637891cf.1.1766144563807;
        Fri, 19 Dec 2025 03:42:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:42:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 0/7] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
Date: Fri, 19 Dec 2025 12:42:15 +0100
Message-Id: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABc6RWkC/23PywoCMQwF0F+Rrq2k7fQxrvwPcRFrRgs61VaKI
 vPvVgUfOMsbyEnujWVKgTKbT24sUQk5xL4GM50wv8N+SzxsamYSpAYLDT/5eOAZndT6yOmAnrv
 GgFQavRaS1b1joi5cnuZyVfMu5HNM1+eJIh7Tl9YKGNGK4MCVRNv6TpAxbrEPPaY4i2nLHlxRb
 0KAtGOEqoTV1th1KxXg+o9oPoQY7VSaSnTWGAPgrCf8I/Q3MfqFrgSIjSKF2Cn3W2QYhjugyuI
 afAEAAA==
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4401;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UaHO7/eOvI9UQifWvLpwmCqdh2eotyE0wYd3BHrZ6yo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTokWXsa2gKI4nKr8h3MYxFUimxm2O4dHtXW6
 KCiHQiv+CiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6JAAKCRAFnS7L/zaE
 w5TBD/0VsHh57NK5nQksuR+8VSL79RDSjE5N4Uss3l4JwiFExzXFJZFpCwifvwH9coSoqlwSmi/
 HJxLjwprjYGZnaU+rNXkOiZ0EsDovcObvNYahOJjd6Lo56NFM5cKuvxZIPtBE+iyaBwmzxnLmu/
 T2hRwgo12C7kTrrBKQUhlfxq8n1b/ffXt8j3ZcPGUYWSirWStJVUES0McEPRujOtu1OkWm1SPmV
 Ejrd9L49HQ+nO6ayV3/BwwVVypRf+179KBzXtsYmh2ARvDwjC12TUaLQ1v4RX9OXsYdoYgch/S6
 yvKvCxXExRkXnvfNQShDqpwxsqQH+ugBqbTLmnyBt4Yr9mDyozKPTqaktQISbSrpK229wF+8Wqv
 8y4/UN1sWaRnu0hyRREDiaMQRMu9WPHyGDpBBS8WNsUk7q//HXhhNZhgg3nn9uvVNiEqwD0mE/F
 awDlTEUaCzTLaExwn/CKC+RL+ri68hNQj1CiAfnruILFOSDcjcS6x2jWeVHJ2DjVby4z6+Gf2vV
 oduw+zcDEJ1Xe9k2AEYXRVqWBwYmIbh2NxHM9AaMWrxwouwIUENXthjhKxJB9V+Z08rtzMIYqnf
 jYCydlPUBZgHMvymTXbhPio9aTl7NoQa5wAPhUk2jOJbwWYIDgFqegzo+VSItUKDNtUvi8/qrdR
 +XbsmEDfNuXywwQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=69453a35 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PHq6YzTAAAAA:8
 a=h7uu4O38hj_b6GN6T5YA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: -oxwJ3vbXQrho6A2aNInWUCMa2nBzuxM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX3r6d3YpmpH4z
 V+L/TiGKSKzAvy+WUzmrBTao0XbwasgcGxfmPHBIUnqpDYwH7Q8MuS0AaeEC6tqlqPUFa09ipUf
 G66MHxYzme53tQVEd9ZIQ7zJlAd0ya9+jSzQrSj5NtzaoB3L8Z2+Ek7Lh14wXWXhstHYv5lw98p
 YmhW33F7QdV9Q84ayfp41jEGaiD7pSxTdiprH/0tKJtTajh03BqycWidl+H0DOp/o/HRKiuJ7nZ
 Ix7hxbiweESYEPL6CEkLnFGN25GYVTeul/LrWrOPFEKpLsx572pfFfyJE4xMO9mLnek+V7Gdx4y
 s4XHhYNX+XAO694TrgM8zI8lA5FCz+EWk9GSArsk+2qTWLhGQ8Xpy3TiisjNCYXFgdIZGawKndy
 t0vbFyXfMVR33sCL1hVS3hst/ZyIVf8JGs384Fxiy8EEm3vKcETZUYLyRwbVSqZOdTmSjWWbUWE
 oqthuLPqiNaOBtdY6JQ==
X-Proofpoint-GUID: -oxwJ3vbXQrho6A2aNInWUCMa2nBzuxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190096

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (7):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 ++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 344 +++++++++++++++++----
 26 files changed, 454 insertions(+), 59 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

