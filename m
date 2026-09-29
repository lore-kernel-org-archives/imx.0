Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B744EE870
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673519; cv=none; b=uoLrriGVvLnQFg0a/QTpidnZAhPzIFxMgOBo12ZmEALQmJehv/OVViRxRSCJDoCgprSuRUueQXUdjg/neAqoGOKC1t+czw/MxuAkvQhsA0OKhEnv2EPQ5iDbNWor4vJHqlnAAX0c2YecM/luM4aUk/3YkDLwoPIHQ5jb5OSBZ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673519; c=relaxed/simple;
	bh=xl+6SGpN5r+JlU8uWnKJTgqgf7MWKOx0cJnxdrgT1hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FJSMureZkYQ0HgQkQxe34qOdwpMQQh9yUS3Asfrtjpp0pzT0bACpZvltmsiD1p6mEZ0jZWoNpYfDZ/U5qJRZx3QlHBePPB4GkvzJ+frActeqPDnEkvwubyi+b9aWuc8d6nQhv06T2gUWeY1Fn9IjhnsM84hErNOprxiYXRhsfx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=cTsNi5VJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="cTsNi5VJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so29956245e9.3
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790673501; x=1791278301; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=;
        b=cTsNi5VJesQ9wc9gPF+FtesKJQzEjDO++SbzJEis97igeH0Hx6a2FLcca30AlMWoP2
         4WXs1/SbPUXD1DFWbTlYycofwlQmur+2oEtM+zU9GVNshGqBUIX6iXOh8YESCC0pHZMT
         wkv6PSgr3h/n2Aq10zQDLB0qPHggf+BWbo23M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673501; x=1791278301;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=;
        b=wbKmRQKyrAV3RT8QuIoKKsXkjsXTN9h4lyn8XlU1FW8W0YVfmapeYZz9fa+Y6SXKuQ
         0/8Z87pw5AIc4Ia4HETsSFdWSHNvc11YWH+U6Bk4HHu/z72Iwj5nfbnAZFjDow5iT9rG
         CIKumFM+C9Vtif6npoUoy7M1SKRDGG1KQPIsTtXhz2oVocdg55j2JILCYBAoBouLR+q+
         MDR/dpBmXz24vq+jDs/wC+5CxV98GpIz9riyAUqJgSB29zrbuDYOK39DdUcvceKaA+9F
         cFy6YfwAS8+8UpGeH4GUx3YSCyoRwfzA/oygwykSsxKKdLmzsqc7d1c3qcZa7oK5SNQ1
         ECiA==
X-Forwarded-Encrypted: i=1; AKwUvBw3YdVie/s5mjNLE6oeuTlqwODcsZ36QRlrRM0qlqdNEaUFT1yl4tRmBVB1DpXkid/WNaE=@lists.linux.dev
X-Gm-Message-State: AFuF++nY9JQveKa2vWOjs7RdxQ4lZg5XwIlN2SAz/oKxi/Ch8xTYreYI
	IkfYP4blWROaPf/mVlB7QqiUkgXGPo++WGd2xHZxGRiMvO1kdG1Vl5yqrcEwOCnHWNo=
X-Gm-Gg: AYBFou0jTfu1mgMsIhM88pHy2HsQ8N1NiiW7FvsBQw06XDd6RY4JhKAtJfgpDGNebZc
	51EGse31WowzaUFls2l5VXEdALdxZqK47m7iyh4JqvoeSqthyFl0jZ2aMwfBFkv/FGHrzDjWfTe
	gV43h6BqfapuSvoar7TeXMAswYhifIaFwKPCjG2p2vPof4PY6mZOtvkRxKgPPQ/18o1pT57rdyx
	WiLDYDOWPqV7bn9LwHtqGoVMKE0J/VA3rVxGkJxW6S8+RZpmY0badVkUevDw2QzYIrl6R2qqZRD
	hk0tvdDxSputn2lscybri3Aa5lZvnVyZBw8ohrokN8VqMG8ckXsiUwFjg3M1tcihge3E5+FddTA
	Pc0ZN0kkpvTUsSQM+IzQU8rM6d3vdRoC3d9zCukHKjgE2bMjQyQmKXQrNUxI71JMrvMq7V6pJ0T
	3jnMiOCmmxPcDOzNVjRXujbkk3uyLBdog4+iFmSdjYzvT0HR7ej1PBUoLNigNBfV8KvrOiL26YV
	E/EGIpzOdBWm7I=
X-Received: by 2002:a05:600c:8b71:b0:4a0:328:43df with SMTP id 5b1f17b1804b1-4a0032847fcmr81130085e9.21.1790673501052;
        Tue, 29 Sep 2026 02:18:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b150sm59178575e9.7.2026.09.29.02.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:20 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Tue, 29 Sep 2026 12:18:08 +0300
Message-ID: <20260929091811.3735201-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v2:

  - add the tag from Conor Dooley <conor.dooley@microchip.com>;

  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
 6 files changed, 497 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

-- 
2.47.3

