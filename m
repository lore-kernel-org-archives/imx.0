Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575647;
	b=OYyrhoqjBvYctJOnEUuuR3pCzgl885wP0LOoB4RqszN5oZ+ii/EO8eNCCcNkP0PRRSN4
	 BZ3ed2y66TV8m4znEYL0tobJ34/AznzgUmLhE8ImBcGPFHPrZiEFse7EfSnVWkHbHvLJz
	 UVa5rb68Uc47PSm5SM2ReViHrnuLPLBM1jHjSZkq72RaxLZ4oPN2J0lLo4pZFfmuVGQYP
	 sgLcaMhtq4tWVewgnPOojI/JvMkO5cHhIW8dk/1MVCOTLAffzHDbTH4qD+Cw+RTgv5U41
	 TVI6RFz00e+xgi3Jc9sXkphb7rqBJ1Uda5MOJN7yz6gaqFR83xFbLpHB7AyhfcJG5WA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575647;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=jDGzUeJoU453C6E72rSA80bKxfeU0j/w1IYP/rP6ntc=;
	b=Epzwlsp7otFg0DcBrR1SvVe+2l/xZbSTv0qVOEZ2WJOAa+1v0RlKhB+7b4Fz7NJSVFoI
	 I1NzGZ5utpQASypfhLZ41h/IUUSLOGxMROENvF51D/mCC0UMNnocWmdVdGjQGCN8I0O0Z
	 P62/EQgPJy3jICOWU+vftsVT7FkPJaZu7/U2sTFMxKB1Tv1xZjP6WYdPB9GfmOO/jdwBi
	 KrYRmYpiyGyd6Lui7ICIR4DKFUmunmqRgYOIHrpuWBXGzPGf7sdJF45Z4gKF52Jji5qpO
	 Vn/cCUJD5te8y42T5zWfZi3m2tr+c1JrqHR8ER+U5tNSgOxYhcGW4uHt0/2ZlfE8ZHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Z43V75Kx;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=DWkHZglW;
	arc=fail smtp.remote-ip=185.56.87.9
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230660A2619
	for <imx@lists.linux.dev>; Sun,  1 Nov 2026 23:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3230660A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Z43V75Kx;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=DWkHZglW
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575646;
	 b=VE/cKm+fY5EjUR4mMWL+xw3YSYB0tmpqfHmNNa86oh6Y7OFJ4kVzo6kUiYsQM/xF68C16yw38o
	  h2kqL5eeEcoyBmD9GTWDBmTiOJT3N9FW0RQjLSNkKmH0YuTwiw7mwkVVM17YZIGyZBzWQbn16g
	  aIUXwg1CATnSqJTkJh9JOV+MVT3ESJaPSwUEyhr+mIpxezv/+fB90UMSHbdQ7vAC4BAyvx21gz
	  6QL/jNkyRY0znaJfpW1v/pkv1O186y5bpT2mVUIOlc47vkRvmX2HPf5j/9r3q6sVt74w/SnvDE
	  JsqPzEjEOf3V/ZnS0fzaD60zER8dQQL9LMLy7J2l8YNSZQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com; s=arckey; t=1793575646;
	bh=wjrwqlTjD+bsGiygLxRdvngnMYwukHYEcpIoG27o7NQ=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=a8a+3p+Sws22agB7X/eD12bmZdc7MfRwwhnwvIKPZC02bfbt2vLjk5zh+iyKnl19ew3rBFG2Pm
	  XLPWzvnO8AWMpVbS9hjnbCwNyykw9gD6uPvHhw+wjgCW5dR+0iuTJ1RnuhX3S+Xt98ynOC4N78
	  lVrM5BfvAqQmVx42y4r/3iVStNtaqYdOxWRmqR69m5cNW6THHi41hYl6R50sJcBesLaX28dh26
	  pqdvgQUdAIAmISet4MPC69uzqNKoGf0SPIz9yBaLQ3AabI9zJDgZ7B99GEebEeRtz9FsDkH5H3
	  Qc4YEHAF0ToBC2cdkzRO32jtR+5bzO30d1tM4Z7YXH2Now==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=jDGzUeJoU453C6E72rSA80bKxfeU0j/w1IYP/rP6ntc=; b=Z43V75Kx+b2UOpe0/h+YCLgBXS
	3hGPiagNqNEf72SL3cjzvhJAy4X27wcr0tQTK56qmkN9gMhe1jU7wXkJdQ8wdHgbKxsZXqHdrNvRr
	uk8iRqNFVHrmu6SoVJtWM/dF5s7LAiIQgrfw6ZVw3mm/T2ajN+Du7/CpmGvk1Qf7Fh/U=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNexK-00000005i6l-1YMB
	for imx@lists.linux.dev;
	Sun, 01 Nov 2026 23:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=jDGzUeJoU453C6E72rSA80bKxfeU0j/w1IYP/rP6ntc=; b=DWkHZglWJBAhWKTBNUqy4BrJ9y
	hYXQHTINCO6Tv62B/pPA57suAYhsZO/5GLNfBvMm+OU7z0msEuGdf4Jj6RinMEOVJInbhyl5XjUOL
	toFsrhRSnLw9ZmeIV69q7ci29XsXzjyNWDsyC/EAViym1PcZNNYULQ5OldBT6CpPTDLY=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex1-000000002I5-09og;
	Sun, 01 Nov 2026 23:26:59 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:43 +0100
Subject: [PATCH RFC v2 06/11] dt-bindings: remoteproc: add
 remoteproc-virtio
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-remoteproc_virtio_map-v2-6-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4131; i=francesco@valla.it;
 h=from:subject:message-id; bh=wjrwqlTjD+bsGiygLxRdvngnMYwukHYEcpIoG27o7NQ=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+1ZOt07pE+76wzvgiav4v7lb8Ovry8SnWzhsihPb
 erBllm2HaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBELC4zMtwWEz+urpm56f7P
 3tM/CwoTV9/fvu+JY3v7Mqv2F8/uCPEyMtxjFZq6euHOhf+t02Y0nutSbTqyhe309lidBe3axTF
 fmvgA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: c26360a3f09c045f617d6084cfe9b2ea
X-AntiAbuse: ID - c26360a3f09c045f617d6084cfe9b2ea
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNexK-00000005i6l-1YMB-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-xdd7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Add a new binding to describe remoteproc-provided virtio devices; while
these are discovered through a resource table parsed by the remoteproc
infrastructure at runtime, their description can be needed to probe
non-discoverable buses (such as I2C) or to link consumers and suppliers.

Each vdev is described by a dedicated "group" node, which then includes
a virtio-device node. Each vdev shall be statically linked to a "group"
node using its index inside the resource table as the reg property of
the node; this permits to have multiple instances of the same type of
device.

The binding is intended to be generic and adopted by any remoteproc
provider.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 .../bindings/remoteproc/remoteproc-virtio.yaml     | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
new file mode 100644
index 000000000000..8cdfa8d0f936
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtio devices over remoteproc
+
+description: |
+  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
+  and its resource table. For some of them, a device tree node might be needed
+  to describe remote undiscoverable hardware and/or connect consumers and
+  providers.
+
+maintainers:
+  - Francesco Valla <francesco@valla.it>
+
+properties:
+  virtio:
+    type: object
+    description: |
+      Contains a group of virtio devices exposed by the firmware running on
+      the remote processor through its resource table.
+
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "@[0-9a-f]+$":
+        type: object
+        description: |
+          A single virtio device exposed by the remote processor. It can
+          contain at most one child node, describing the virtio device itself
+          (e.g., to declare devices on a non-discoverable bus or to act as a
+          provider for other nodes).
+
+        properties:
+          reg:
+            description: |
+              Position of the virtio device among the VDEV resources contained
+              inside the resource table.
+            maxItems: 1
+
+          memory-region:
+            description: |
+              Memory region used for the buffers exchanged with the remote
+              processor. A restricted-dma-pool region forces all buffers to
+              be bounced through it.
+            maxItems: 1
+
+        additionalProperties:
+          type: object
+          $ref: /schemas/virtio/virtio-device.yaml#
+
+        required:
+          - reg
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+additionalProperties: true
+
+examples:
+  - |
+    remoteproc-cm33 {
+        virtio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            vdev@0 {
+                reg = <0>;
+
+                gpio {
+                    compatible = "virtio,device29";
+
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                };
+            };
+
+            vdev@1 {
+                reg = <1>;
+                memory-region = <&vdev1_buffer>;
+
+                i2c {
+                    compatible = "virtio,device22";
+
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    eeprom@50 {
+                        compatible = "atmel,24c1025";
+                        reg = <0x50>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.56.0

