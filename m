Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563344;
	b=RQxdtl/p3nhW9W1+WWiQBND9N+R9pXGplawdVIfwX38DYs55GGVtk9drWVUeJSwjXFDi
	 8cbleY2U7xXnIh+tdt0ArKI/CKNdOS8CPqI7ir5rIXEmiSgBXvOjpqc4i4vsjV6zwiXw6
	 LUzOiVGPJ0H8+o8fbjFBLZqrmpwM2IX8mJf8aZL4Nec/LkGeP4HS6EglzLnHfHnJ7mdzC
	 Z3E8zyGhM8sLcMv/O4unz9QpkMVbn//lvN6TlFfbwvVrdbM3PgVglPkaNlmeO5pNL/Hpf
	 qY7Il/GZAN+WM2P0NKjFpddcYBWvs83jCVu1A5OR4Ro/r0avSBHnZTf+4WNZN0cvsIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563344;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=YZmqmLJRXHyb5TEcNFD3Z2Hg3A2sSvnpqg4Pbj33TnM=;
	b=l21tEi79tfjAFpqQmfktjbV/kpg1uzmvnxN+V+MiVIMxAB+N4d/h9tgYOYMCMXEtH1CC
	 A2wuQIx6BR4ZlUUl4/WtnB07wnZ+2phuQr3Pm6/kazviv0SNUw8Rjp2WccXhjq5p6wIZ4
	 r3VBmDn3eF53OQCglMRiLABVULQlp3UqebMDj2SndzmAKiH1OZ6rId4LVgOv7EXhZeXRQ
	 POoojqtjFvskUAqRpf8qe+ntXhsMq7CeLZy5oMxMdLUQi4cNMI4RlaZ4sV+i/rVJ5JfSE
	 dTH+GChOKFT3Eg7XM5TFvz4Gh9W0UUzgeGWT+OQvgaaXZTTWYpA2yKU3IHoshibxgcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=V6kKElqp;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61E7606A325;
	Sun,  1 Nov 2026 20:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61E7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=V6kKElqp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1793563327; x=1794168127; i=wahrenst@gmx.net;
	bh=YZmqmLJRXHyb5TEcNFD3Z2Hg3A2sSvnpqg4Pbj33TnM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V6kKElqprjU+qBpI6Wcr7elMOY+wO0RBDpKXrnCVP+QTohrAOB9YND5972AQZg8g
	 RjWTugO5XHbxtJ/wptJ3sYwER9FbCU90jg0Zq2R2Tatjz44IRI/45xqx2rFY7s84h
	 liyKjZFp6NoA306wP5jV5vTFj26q4WW9bZx5wwbXjIKQuVy0ZN5jZ0E8Cl3yX6Dji
	 OjOiygCVUhRiIbN+PPG/XQh5/T4ahkko3GkkhEsdzxTn8Hgj81ZvIlRfOlQFmMvLW
	 0CDpYsmEDKYN3nB+S7DYRsTsD95AIJeAtyVTsNvpeFmeygSOALyWSQ/vCW7rHBR+r
	 UlKpMHi68zey1OvCQg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpJg-1wnihh2xAw-00pn9A; Sun, 01
 Nov 2026 21:02:07 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/3] dt-bindings: mfd: nxp,bbnsm: Add NVMEM for GP registers
Date: Sun,  1 Nov 2026 21:01:38 +0100
Message-ID: <20261101200140.141642-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101200140.141642-1-wahrenst@gmx.net>
References: <20261101200140.141642-1-wahrenst@gmx.net>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MCFp/EJfbxSbv3GBdOC710LReNvy7brqbjCZc0BTT4kEt88hsH0
 c+J3NdVopkUDAQemTOAWzQTsRtYgV192uLu20FgEqokvpla7beF+RYSufRJEMUvegwKuZYv
 697CqZicVDarHUgMhOc92pY2S/Lz/agapq5PBPz/FepdiEFNWvuod26Y7K7nHP+RhVHsm4A
 WOH1S2dlDXrRMKv+vuIPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rnsJZDt5TdE=;pHqdlBKaiQ9nHmY4a2TG/9UjjQi
 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
 SpSl8oe7T/NnOuy00PM1sRPqeYA==

Document bindings for the optional Battery-Backed Non-Secure Module
general purpose registers available on i.MX9 SoCs.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Docume=
ntation/devicetree/bindings/mfd/nxp,bbnsm.yaml
index b1ade64a1554..4c4b7c3fff2a 100644
=2D-- a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
+++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
@@ -31,6 +31,20 @@ properties:
   reg:
     maxItems: 1
=20
+  nvmem:
+    type: object
+    $ref: /schemas/nvmem/nvmem.yaml#
+
+    properties:
+      compatible:
+        enum:
+          - nxp,imx93-bbnsm-nvmem
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
   rtc:
     type: object
     $ref: /schemas/rtc/rtc.yaml#
@@ -88,6 +102,12 @@ examples:
         compatible =3D "nxp,imx93-bbnsm", "syscon", "simple-mfd";
         reg =3D <0x44440000 0x10000>;
=20
+        nvmem {
+            compatible =3D "nxp,imx93-bbnsm-nvmem";
+            #address-cells =3D <1>;
+            #size-cells =3D <1>;
+        };
+
         bbnsm_rtc: rtc {
             compatible =3D "nxp,imx93-bbnsm-rtc";
             interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
=2D-=20
2.53.0

