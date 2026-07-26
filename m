Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B22931D8
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 05:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785043512; cv=none; b=ABgZSPj2xhf6OHVnMaL0xiZZbx44llGv1ljJLwy0OVi7+22TCl1PMm0TquAoZ0UouH7OryRU2vZvk3UAkvNDlDL05nPnqpAGP1h0bSRm7pmYimcFU8JLKM/JmNybNSeb8bvQy/MOEUQzCflAuyrbXZmGOYXOmgZKqHszZ23WWPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785043512; c=relaxed/simple;
	bh=I6Fu0+DNr7LT4DtiL5EfzHWIUsnAEk+xip2XdPhClZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IMYRIaYxhTCGo5masQJibffFVFqDCIyVs9WdpiD/uqnGDIaAQnhbJiSUQGdVI31+Za0kuqPSbvOmflnJ/roRp8afkjtoYrWzXznUTQEBZKlm3fAB444X+xngnaLPmUCirVfkM0ySlyuM57+aR4NQzmPX3CtuDkLJclqsosXXBLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/QglW1H; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/QglW1H"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8486672f03cso1664193b3a.0
        for <imx@lists.linux.dev>; Sat, 25 Jul 2026 22:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785043510; x=1785648310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u8wfTYxHZK0x/PfVX6/DZH7+LGApngF9lOfO/2V5Zp8=;
        b=S/QglW1HHdiDHm1ufTz0cu93I1XzY1l7ifZiP9pF51xTIW6Mr6X64KViYgpOu9u9fn
         5pGp1DQSEJVFzhNi1e8VL0fliHxQLZmgtEaiPxoI4u3R6Uw7HimkaeyGro/Rd1gXRqfx
         E4O0gHWoFKOj0IdC9B0lBirZFLrgkQc6V/srZaiB67IS0joyzSfK1Dl+vwDNpkvkPFct
         zVPQBqGolqW7zHvFNakJ0R4yM8IwWttfNCS+y7cI7os0SKe176H5pGj8yjANPWtPJLOB
         XGisOPxKGm9NnDc4cXvpCt398ygFArlZSnnFFMU9hcbpeQ7LE5kQsOSWcHBxCpjeMHar
         m32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785043510; x=1785648310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8wfTYxHZK0x/PfVX6/DZH7+LGApngF9lOfO/2V5Zp8=;
        b=FmD61+NMKGZ+vVgs/jIsVDgJdvEC7qhdGdvFveH7Xh3CQ3ZyO1c44p/MLSryZ/h5dJ
         jRmI7K588v/HBfcQ45N1/TcXbmFhL53kwE2HQOnD9rXGOUY9ANHbnuTxjKeinP93KQtr
         fL8Lm1E7DXnk0eRbn8xIWbJmnci1zPF8/7pWVgitVffMFwKK7DAZ/ltOQdw4NFYhnHkI
         qDOQctGxIBJomNSiTRHdeSDQRtUwJepGMoIchM09Z3oHFN3vjCgnwc05WUIDw3Y2R1nV
         RYCEDC7/CcJ6PuTenJgcwCFLCRGDbtEDh5DnxqXjlluV0OZOUelPsI8DVMtJDv8CYjO6
         v2nw==
X-Forwarded-Encrypted: i=1; AHgh+RravaAzuJel2PTjU0Elg9VJImVqcHFKMidnMNZW/pzlc3azZSLEUzavKrGsJN3UScScbQ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGQ49Ki0zvAAKKUqHn3+0PZO4so5AXZMt4fRb+eHaTCEBNfKAS
	+Mb2ipmzeuxxyGcuXraLm+a74YJrxD1wzQUJ5ryX1uvvoUcxFTRGriEh
X-Gm-Gg: AR+sD12ebFWjj0Fe2f0dwU0E6BpEjrg8HMmqjeYZ9vvMapdN+1XRli47Xx4d+CnUCbr
	PY666XBnVWzG5ZcwPLO1ey1lRYoEEKKDDjylo33pIdLDgiM8Ehmr0cnaM/PXNxtNzy591w3gGvd
	inVUGp6wk8kEF+JNGlslfpXzo7VC5OvtxzVpJJDAWMkeNEvSTJo5m7vSj5fUFytRAbTq3NYfnDy
	njEHiofxEkD/u52jilOXOqcvIs2XBnnw+QkgoCOYRCHlqvdbnd2rL7o6Q7x19RhsednsVAbuQ+u
	MEV73ws0n+ha+/5PfwrGiF8mLQYJkT4lwRfTcbV2EvjZd7UmFszBlC8bR2pqhdej2rE5TKmddiX
	Eyzee1YIhC5CpG9n1yE1XMysklaWPpDgKocQLU8wA1UVA+dFWYn6Ks7CXpNZCq+m2ypXA7q1SYo
	T0uG2h/BudoKHFI4IH66qAW3Y6V3j/pN4=
X-Received: by 2002:a05:6a00:988:b0:84a:29a7:f650 with SMTP id d2e1a72fcca58-84e5925e2a3mr3164991b3a.0.1785043509591;
        Sat, 25 Jul 2026 22:25:09 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e530079f1sm1574772b3a.0.2026.07.25.22.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:25:08 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Frank <Frank.Sae@motor-comm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Linux Team <linux-imx@nxp.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Frank Sae <frank.sae@motor-comm.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next] dt-bindings: net: fix spelling errors
Date: Sun, 26 Jul 2026 10:54:29 +0530
Message-ID: <20260726052429.16807-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling errors reported by codespell:

  encompases -> encompasses (stm32-dwmac, sti-dwmac, nxp,dwmac-imx)
  curren     -> current     (motorcomm,yt8xxx)

No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml | 4 ++--
 Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml    | 2 +-
 Documentation/devicetree/bindings/net/sti-dwmac.txt         | 2 +-
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml      | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
index 26688e2302ea..e8108cde0f59 100644
--- a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
+++ b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
@@ -59,7 +59,7 @@ properties:
       be configured with hardware pull-up resistors to match the SOC voltage
       (usually 1.8V).
       The software can read the registers to obtain the LDO voltage and configure
-      the legal drive strength(curren).
+      the legal drive strength(current).
       =====================================================
       | voltage |        current Available (uA)           |
       |   1.8v  | 1200 2100 2700 2910 3110 3600 3970 4350 |
@@ -76,7 +76,7 @@ properties:
       be configured with hardware pull-up resistors to match the SOC voltage
       (usually 1.8V).
       The software can read the registers to obtain the LDO voltage and configure
-      the legal drive strength(curren).
+      the legal drive strength(current).
       =====================================================
       | voltage |        current Available (uA)           |
       |   1.8v  | 1200 2100 2700 2910 3110 3600 3970 4350 |
diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index e5db346beca9..75c9820ee60b 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -72,7 +72,7 @@ properties:
           - description: the offset of the GPR register
     description:
       Should be phandle/offset pair. The phandle to the syscon node which
-      encompases the GPR register, and the offset of the GPR register.
+      encompasses the GPR register, and the offset of the GPR register.
 
   nvmem-cells: true
 
diff --git a/Documentation/devicetree/bindings/net/sti-dwmac.txt b/Documentation/devicetree/bindings/net/sti-dwmac.txt
index e16287c06e5e..6e7e77da49bc 100644
--- a/Documentation/devicetree/bindings/net/sti-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/sti-dwmac.txt
@@ -9,7 +9,7 @@ The device node has following properties.
 Required properties:
  - compatible	: "st,stih407-dwmac"
  - st,syscon : Should be phandle/offset pair. The phandle to the syscon node which
-   encompases the glue register, and the offset of the control register.
+   encompasses the glue register, and the offset of the control register.
  - st,gmac_en: this is to enable the gmac into a dedicated sysctl control
    register available on STiH407 SoC.
  - pinctrl-0: pin-control for all the MII mode supported.
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 987254900d0d..fac882198a46 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -91,12 +91,12 @@ properties:
     items:
       - minItems: 2
         items:
-          - description: phandle to the syscon node which encompases the glue register
+          - description: phandle to the syscon node which encompasses the glue register
           - description: offset of the control register
           - description: field to set mask in register
     description:
       Should be phandle/offset pair. The phandle to the syscon node which
-      encompases the glue register, the offset of the control register and
+      encompasses the glue register, the offset of the control register and
       the mask to set bitfield in control register
 
   st,ext-phyclk:

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.43.0

